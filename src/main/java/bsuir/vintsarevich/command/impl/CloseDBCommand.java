package bsuir.vintsarevich.command.impl;

import bsuir.vintsarevich.command.ICloseDBCommand;
import bsuir.vintsarevich.dao.CloseDB;
import bsuir.vintsarevich.dao.ICloseDB;
import bsuir.vintsarevich.exception.service.ServiceException;
import org.apache.log4j.Logger;

public class CloseDBCommand implements ICloseDBCommand {
    private static Logger logger = Logger.getLogger(CloseDBCommand.class);

    @Override
    public void closeDB()  {
        try {
            ICloseDB closeDB = new CloseDB();
            closeDB.closeConnections();
        } catch (ServiceException e) {
            logger.error(e);
        }
    }
}
