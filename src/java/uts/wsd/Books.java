package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Books implements Serializable {

    @XmlElement(name = "book")
    private ArrayList<Book> list = new ArrayList<>();
    
   
    public Books() {
        // TODO Auto-generated constructor stub
    }

    public ArrayList<Book> getReservedBooks() {
        ArrayList<Book> reservedBooks = new ArrayList<>();
        for (Book book : list) {
            if (book.getInfo().isReserved()) {
                reservedBooks.add(book);
            }
        }
        return reservedBooks;
    }

    public ArrayList<Book> getQuantityBooks(String title) {
        ArrayList<Book> quantityBooks = new ArrayList<>();
        for (Book book : list) {
            if (book.getTitle().matches(title)) {
                if (book.getInfo().isReserved()) {
                    quantityBooks.add(book);
                }
            }
        }
        return quantityBooks;
    }
 

    public ArrayList<Book> getBookByUser(String username) {
        ArrayList<Book> books = new ArrayList<>();
        for (Book book : list) {
            if (book.getInfo().getUserUsername().equals(username)) {
                books.add(book);
            }
        }
        return books;
    }

    public void addBook(Book book) {
        list.add(book);
    }

    public Book removeBook(String title) {

        //Iterators allow the caller to remove elements from the underlying collection during the iteration with well-defined semantics.
        Iterator<Book> iter = list.iterator();
        while (iter.hasNext()) {
            Book book = iter.next();

            if (book.getTitle().equals(title)) {
                iter.remove();
            }
        }

        //for (Book book : list) {
        //   if (book.getTitle().equals(title)) {
        //        list.remove(book);
        //   }
        //} 
        return null;
    }

    public ArrayList<Book> getList() {
        return list;
    }

   

    public int getID(String title) {
        for (Book book : list) {
            if (book.getTitle().equals(title)) {
                return book.getId();
            }
        }
        return -1;
    }

    public Book findBook(String title) {

        for (Book book : list) {
            if (book.getTitle().equals(title)) {
                return book;
            }
        }
        return null;
    }
}
