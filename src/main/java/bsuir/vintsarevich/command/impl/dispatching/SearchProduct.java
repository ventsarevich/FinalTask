package bsuir.vintsarevich.command.impl.dispatching;

import bsuir.vintsarevich.buisness.product.service.IProductService;
import bsuir.vintsarevich.command.ICommand;
import bsuir.vintsarevich.entity.Product;
import bsuir.vintsarevich.enumeration.AttributeParameterName;
import bsuir.vintsarevich.enumeration.JspPageName;
import bsuir.vintsarevich.enumeration.RedirectingCommandName;
import bsuir.vintsarevich.exception.service.ServiceException;
import bsuir.vintsarevich.factory.service.ServiceFactory;
import bsuir.vintsarevich.utils.Common;
import bsuir.vintsarevich.utils.SessionElements;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class SearchProduct implements ICommand {
    private static final Logger LOGGER = Logger.getLogger(Index.class);
    private ServiceFactory serviceFactory = ServiceFactory.getInstance();
    private JspPageName jspPageName = JspPageName.INDEX;
    private String productName;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        LOGGER.log(Level.INFO, "Search command start");
        try {
            String name = request.getParameter(AttributeParameterName.SEARCH_NAME.getValue());
            if (name != null) {
                productName = name;
                request.getSession().setAttribute("currentPage", 1);
            }
            setPageProduct(request);
            Common.setReview(request);
            request.getSession().setAttribute("pageCommand", RedirectingCommandName.SEARCH_PRODUCT.getCommand());
        } catch (ServiceException e) {
            LOGGER.log(Level.DEBUG, this.getClass() + ":" + e.getMessage());
            jspPageName = JspPageName.ERROR;
        }
        LOGGER.log(Level.INFO, "Search command finish");
        return jspPageName.getPath();
    }

    /**
     * @param request
     * @throws ServiceException
     */
    private void setPageProduct(HttpServletRequest request) throws ServiceException {
        IProductService productService = serviceFactory.getProducteService();
        List<Product> products = productService.getAllProducts();
        List<Product> allProducts = new ArrayList<>();
        for (Product product : products) {
            if (product.getNameEn().toLowerCase().contains(productName.toLowerCase())
                    || product.getNameRu().toLowerCase().contains(productName.toLowerCase())) {
                allProducts.add(product);
            }
        }
        if (allProducts.size() == 0) {
            diagnoseError(request);
            request.getSession().setAttribute("pageCount", 0);
        } else {
            Common.calculatePageNumber(request,allProducts);
        }
    }

    private void diagnoseError(HttpServletRequest request) {
        if (SessionElements.getLocale(request).equals("ru")) {
            request.setAttribute(AttributeParameterName.PRODUCT_NOT_FIND.getValue(), "Ничего не найдено");
        } else {
            request.setAttribute(AttributeParameterName.PRODUCT_NOT_FIND.getValue(), "Nothing found");
        }
    }
}
