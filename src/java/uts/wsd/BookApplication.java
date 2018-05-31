package uts.wsd;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class BookApplication implements Serializable {

    private String bookFilePath;
    private Books books;

    public BookApplication() {
        // TODO Auto-generated constructor stub
    }

    public String getBookFilePath() {
        return bookFilePath;
    }

    public void setBookFilePath(String bookFilePath) throws JAXBException, IOException {
        this.bookFilePath = bookFilePath;

        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Unmarshaller u = jc.createUnmarshaller();
        FileInputStream fin = new FileInputStream(bookFilePath);
        books = (Books) u.unmarshal(fin);
        fin.close();
    }

    public void save() throws JAXBException, FileNotFoundException {
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        m.marshal(books, new FileOutputStream(bookFilePath));
    }

    public void updateXML(Books books, String bookFilePath) throws Exception {
        this.books = books;
        this.bookFilePath = bookFilePath;

        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(bookFilePath);
        m.marshal(books, fout);
        fout.close();
    }

    public Books getBooks() {
        return books;
    }

    public void setBooks(Books books) {
        this.books = books;
    }
}
