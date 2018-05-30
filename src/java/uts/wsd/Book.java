package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;

import com.sun.prism.shader.Texture_Color_AlphaTest_Loader;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlRootElement;


@XmlAccessorType(XmlAccessType.FIELD)
public class Book implements Serializable {

    @XmlAttribute(name = "id")
    private int id;
    @XmlElement(name = "title")
    private String title;
    @XmlElement(name = "author")
    private String author;
    @XmlElement(name = "date")
    private String date;
 
    @XmlElement(name = "category")
    private String category;
    @XmlElement(name = "description")
    private String description;
    @XmlElement(name = "condition")
    private String condition;
    @XmlElement(name = "userUsername")   
	private String userUsername;
    @XmlElement(name = "reserved")   
	private boolean reserved;

  
    @XmlElementWrapper
    @XmlElement(name = "reservation")
    private ArrayList<Reserve> reserves = new ArrayList<>();

    public Book() {
        // TODO Auto-generated constructor stub
    }

    public Book(Integer id, String title, String author, String date, String category, String description,String condition, String userUsername, boolean reserved  ) {
        super();
        this.id = id;
        this.title = title;
        this.author = author;
        this.date = date;
        this.category = category;
        this.description = description;
        
       this.condition = condition;
        this.userUsername = userUsername;
        this.reserved = reserved;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

   

    public void addReserve(Reserve reserve) {
        reserves.add(reserve);
    }
    
    public void removeReserve(Reserve reserve) {
        reserves.remove(reserve);
    }

    public ArrayList<Reserve> getReserves() {
        return reserves;
    }

    public void setReserves(ArrayList<Reserve> reserves) {
        this.reserves = reserves;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

   

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getUserUsername() {
        return userUsername;
    }

    public void setUserUsername(String userUsername) {
        this.userUsername = userUsername;
    }

    public boolean isReserved() {
        return reserved;
    }

    public void setReserved(boolean reserved) {
        this.reserved = reserved;
    }

  

    


}
