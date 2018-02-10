package bsuir.vintsarevich.command.impl.redirecting;

import bsuir.vintsarevich.buisness.client.service.IClientService;
import bsuir.vintsarevich.buisness.order.service.IOrderService;
import bsuir.vintsarevich.command.ICommand;
import bsuir.vintsarevich.entity.Client;
import bsuir.vintsarevich.entity.User;
import bsuir.vintsarevich.enumeration.AttributeName;
import bsuir.vintsarevich.enumeration.JspPageName;
import bsuir.vintsarevich.enumeration.RedirectingCommandName;
import bsuir.vintsarevich.factory.service.ServiceFactory;
import bsuir.vintsarevich.utils.SessionElements;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignUp implements ICommand {
    private static final Logger LOGGER = Logger.getLogger(SignUp.class);
    private ServiceFactory serviceFactory = ServiceFactory.getInstance();
    private JspPageName jspPageName = JspPageName.ERROR;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        LOGGER.log(Level.INFO, "Command: Start Sign Up");
        try {
            IClientService clientService = serviceFactory.getClientService();
            IOrderService orderService = serviceFactory.getOrderService();
            String login = request.getParameter(AttributeName.SIGNUP_LOGIN.getValue());
            String password = request.getParameter(AttributeName.SIGNUP_PASSWORD.getValue());
            String name = request.getParameter(AttributeName.SIGNUP_NAME.getValue());
            String surname = request.getParameter(AttributeName.SIGNUP_SURNAME.getValue());
            String email = request.getParameter(AttributeName.SIGNUP_EMAIL.getValue());
            Client client = clientService.signUp(name, surname, login, password, email);
            if (client == null) {
                diagnoseError(request);
            } else {
                User user = new User(client.getId(), client.getLogin(), "client", client.getName(), client.getSurname(), client.getStatus(), false);
                orderService.addOrder("Not order", 0.0, client.getId());
                HttpSession session = request.getSession();
                session.setAttribute(AttributeName.USER.getValue(), user);
                LOGGER.log(Level.INFO, "Successful sign in account as " + login);
            }
            response.sendRedirect(RedirectingCommandName.INDEX.getCommand());
        } catch (Exception e) {
            LOGGER.log(Level.DEBUG, this.getClass() + ":" + e.getMessage());
            jspPageName = JspPageName.ERROR;
        }
        LOGGER.log(Level.INFO, "Command: Finish Sign Up");
        return jspPageName.getPath();
    }

    private void diagnoseError(HttpServletRequest request) {
        if (SessionElements.getLocale(request).equals("ru")) {
            request.setAttribute(AttributeName.FIND_BY_TYPE_ERROR.getValue(), "Пользователя с таким логином уже сужествует");
        } else {
            request.setAttribute(AttributeName.FIND_BY_TYPE_ERROR.getValue(), "User with such login already exists");
        }
    }
}