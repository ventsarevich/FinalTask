package bsuir.vintsarevich.buisness.order.dao.impl;

import bsuir.vintsarevich.buisness.order.dao.IOrderDao;
import bsuir.vintsarevich.connectionpool.ConnectionPool;
import bsuir.vintsarevich.entity.Order;
import bsuir.vintsarevich.exception.dao.ConnectionException;
import bsuir.vintsarevich.exception.dao.DaoException;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


public class OrderDAO implements IOrderDao {

    private static final Logger LOGGER = Logger.getLogger(OrderDAO.class);
    private static String ADD_ORDER = "INSERT INTO epamcafe.order (orderStatus, orderCost,clientId) VALUES(?,?,?)";
    private static String GET_ORDERID_BY_CLIENTID = "SELECT epamcafe.order.orderId " +
            "FROM(client join epamcafe.order ON client.clientId = epamcafe.order.clientId)" +
            " WHERE client.clientId = ?;";
    private static String GET_ORDER_BY_CLIENTID = "SELECT * FROM(client join epamcafe.order ON client.clientId = epamcafe.order.clientId)" +
            " WHERE client.clientId = ?;";
    private static String EDIT_ORDER = "UPDATE epamcafe.order SET epamcafe.order.orderCost = (epamcafe.order.orderCost + ?) " +
            "WHERE epamcafe.order.orderId = ?";
    private ConnectionPool connectionPool;
    private Connection connection;
    private ResultSet resultSet;
    private PreparedStatement statement;
    private Order orderEntity;
    private List<Order> orders;

    @Override
    public boolean addOrder(Order order) throws DaoException {
        LOGGER.log(Level.DEBUG, "Product DAO: Add order start");
        try {
            System.out.println(order);
            connectionPool = ConnectionPool.getInstance();
            connection = connectionPool.retrieve();
            statement = null;
            statement = connection.prepareStatement(ADD_ORDER);
            statement.setString(1, order.getStatus());
            statement.setDouble(2, order.getCost());
            statement.setInt(3, order.getClientId());
            if (statement.executeUpdate() != 0) {
                LOGGER.log(Level.DEBUG, "Add order success");
                return true;
            } else {
                LOGGER.log(Level.DEBUG, "Add order finish");
                return false;
            }
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e1) {
                throw new DaoException(e);
            }
            throw new DaoException("Error of query to database(addOrder)", e);
        } catch (ConnectionException e) {
            throw new DaoException("Error with connection with database" + e);
        } finally {
            if (connectionPool != null) {
                connectionPool.putBackConnection(connection, statement, resultSet);
            }
            LOGGER.log(Level.DEBUG, "Product DAO: Add order finish");
        }
    }


    @Override
    public Integer getOrderIdByClientId(Integer clientId) throws DaoException {
        LOGGER.log(Level.DEBUG, "Order DAO: start get orderId by clientId");
        Integer orderId = -1;
        try {
            connectionPool = ConnectionPool.getInstance();
            connection = connectionPool.retrieve();
            statement = null;
            statement = connection.prepareStatement(GET_ORDERID_BY_CLIENTID);
            statement.setInt(1, clientId);
            resultSet = null;
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                orderId = resultSet.getInt("orderId");
            }
            LOGGER.log(Level.INFO, orders);
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e1) {
                throw new DaoException(e);
            }
            throw new DaoException("Error of query to database(getProducts)", e);
        } catch (ConnectionException e) {
            throw new DaoException("Error with connection with database" + e);
        } finally {
            if (connectionPool != null) {
                connectionPool.putBackConnection(connection, statement, resultSet);
            }
        }
        LOGGER.log(Level.DEBUG, "Order DAO: Finish get orderId by clientId");
        return orderId;
    }

    @Override
    public boolean editOrder(Integer clientId, Double orderCost, Integer productCount) throws DaoException {
        LOGGER.log(Level.DEBUG, "Order DAO: edit start");
        Integer orderId = getOrderIdByClientId(clientId);
        try {
            connectionPool = ConnectionPool.getInstance();
            connection = connectionPool.retrieve();
            statement = null;
            statement = connection.prepareStatement(EDIT_ORDER);
            statement.setDouble(1, (orderCost * productCount));
            statement.setInt(2, orderId);
            if (statement.executeUpdate() != 0) {
                LOGGER.log(Level.DEBUG, "edit order success");
                return true;
            } else {
                LOGGER.log(Level.DEBUG, "edit order finish");
                return false;
            }
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e1) {
                throw new DaoException(e);
            }
            throw new DaoException("Error of query to database(edit order)", e);
        } catch (ConnectionException e) {
            throw new DaoException("Error with connection with database" + e);
        } finally {
            if (connectionPool != null) {
                connectionPool.putBackConnection(connection, statement, resultSet);
            }
            LOGGER.log(Level.DEBUG, "Order DAO: edit finish");
        }
    }

    @Override
    public Order getOrderByClientId(Integer clientId) throws DaoException {
        LOGGER.log(Level.DEBUG, "Order DAO: start get order by clientId");
        orderEntity = null;
        try {
            connectionPool = ConnectionPool.getInstance();
            connection = connectionPool.retrieve();
            statement = null;
            statement = connection.prepareStatement(GET_ORDER_BY_CLIENTID);
            statement.setInt(1, clientId);
            resultSet = null;
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                orderEntity = createOrderByResaultSet(resultSet);
            }
            LOGGER.log(Level.INFO, orders);
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException e1) {
                throw new DaoException(e);
            }
            throw new DaoException("Error of query to database(getProducts)", e);
        } catch (ConnectionException e) {
            throw new DaoException("Error with connection with database" + e);
        } finally {
            if (connectionPool != null) {
                connectionPool.putBackConnection(connection, statement, resultSet);
            }
        }
        LOGGER.log(Level.DEBUG, "Order DAO: Finish get order by clientId");
        return orderEntity;
    }

    private Order createOrderByResaultSet(ResultSet resultSet) throws SQLException {
        Order order = new Order();
        order.setClientId(resultSet.getInt("clientId"));
        order.setCost(resultSet.getDouble("orderCost"));
        order.setData(resultSet.getString("orderData"));
        order.setId(resultSet.getInt("orderId"));
        order.setStatus(resultSet.getString("orderStatus"));
        return order;
    }


}



