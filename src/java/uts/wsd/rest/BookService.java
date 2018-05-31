/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.rest;

import java.io.IOException;
import javax.servlet.ServletContext;

import javax.xml.bind.JAXBException;
import javax.ws.rs.*;
import javax.ws.rs.core.*;

import uts.wsd.*;

/**
 *
 * @author songc
 */
@Path("/bookApp")
public class BookService {

    @Context
    private ServletContext application;

    private BookApplication getBookApp() throws JAXBException, IOException, Exception {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        synchronized (application) {
            BookApplication bookApp = (BookApplication) application.getAttribute("bookApp");
            if (bookApp == null) {
                bookApp = new BookApplication();
                bookApp.setBookFilePath(application.getRealPath("WEB-INF/books.xml"));
                application.setAttribute("bookApp", bookApp);
            }
            return bookApp;
        }

    }

    @Path("books")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Books getBooks() throws JAXBException, IOException, Exception {
        return getBookApp().getBooks();
    }

    @Path("books/{userUsername}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Book getBylist(@PathParam("userUsername") String userUsername) throws JAXBException, IOException, Exception {
        return getBookApp().getBooks().getBookUser(userUsername);
    }
    
    @Path("book/{reserved}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Book getByStatus(@PathParam("reserved") Boolean reserved) throws JAXBException, IOException, Exception {
        return getBookApp().getBooks().getReservedBookR(reserved);
    }
    
    @Path("{condition}")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Book getByCondition(@PathParam("condition") String condition) throws JAXBException, IOException, Exception {
        return getBookApp().getBooks().getByCondition(condition);
    }

}
