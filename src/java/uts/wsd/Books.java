package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "books", namespace = "http://www.uts.edu.au/31284/wsd-books")
public class Books implements Serializable {

    @XmlElement(name = "book")
    private ArrayList<Book> list = new ArrayList<>();

    public Books() {
        // TODO Auto-generated constructor stub
    }

    //Return a new array containing only books that have not been reserved.
    public ArrayList<Book> getReservedBooks() {
        ArrayList<Book> reservedBooks = new ArrayList<>();
        for (Book book : list) {
            if (book.isReserved()) {
                reservedBooks.add(book);
            }
        }
        return reservedBooks;
    }

    public Book getReservedBookR(boolean s) {
        for (Book book : list) {
            if (book.isReserved() == s) {
                return book;
            }
        }
        return null;
    }

    public Book getByCondition(String condition) {
        for (Book book : list) {
            if (book.getCondition().equals(condition)) {
                return book;
            }
        }
        return null;
    }

    //Return new array of books with matching title.
    public ArrayList<Book> getQuantityBooks(String title) {
        ArrayList<Book> quantityBooks = new ArrayList<>();
        for (Book book : list) {
            if (book.getTitle().matches(title)) {
                if (book.isReserved()) {
                    quantityBooks.add(book);
                }
            }
        }
        return quantityBooks;
    }

    public ArrayList<Book> getBookByUser(String username) {
        ArrayList<Book> books = new ArrayList<>();
        list.forEach(b -> System.out.println(b.getId() + ", " + b.getTitle()));
        for (Book book : list) {
            if (book.getUserUsername().equals(username)) {
                books.add(book);
            }
        }
        return books;
    }

    //Return a new array of books listed by user.
    public Book getBookUser(String username) {
        for (Book book : list) {
            if (book.getUserUsername().equals(username)) {
                return book;
            }
        }
        return null;
    }

    public void addBook(Book book) {
        list.add(book);
    }

    //Remove book by title. 
    public Book removeBook(String title) {

        //Iterators allow the caller to remove elements from the underlying collection during the iteration with well-defined semantics.
        Iterator<Book> iter = list.iterator();
        int i = 0;
        while (iter.hasNext() && i == 0) {
            Book book = iter.next();
            if (book.getTitle().equals(title)) {
                iter.remove();
                i++;
            }
        }
        return null;
    }

    //Return a new array of ONLY one of each book title.
    public ArrayList<Book> listBookByTitle() {
        ArrayList<Book> listedBooks = new ArrayList<>();
        int i = 0;

        for (Book listBooks : list) {
            if (i < list.size()) {
                i++;
                boolean duplicateFound = false;
                for (Book listBooks2 : listedBooks) {
                    if (listBooks2.getTitle().matches(listBooks.getTitle())) {
                        duplicateFound = true;
                    }
                }
                if (duplicateFound == false) {
                    listedBooks.add(listBooks);
                }
            }

        }
        if (list.isEmpty() == false) {
            return listedBooks;
        } else {
            return null;
        }

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

    //Return book by Id
    public Book findBookById(String id) {

        for (Book book : list) {
            if (String.valueOf(book.getId()).equals(id)) {
                return book;
            }
        }
        return null;
    }

    public Book iterFindBook(String title) {

        //Iterators allow the caller to remove elements from the underlying collection during the iteration with well-defined semantics.
        Iterator<Book> iter = list.iterator();
        while (iter.hasNext()) {
            Book book = iter.next();

            if (book.getTitle().equals(title)) {
                return book;
            }
        }
        return null;
    }
}
