package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;

import com.sun.prism.shader.Texture_Color_AlphaTest_Loader;

@XmlAccessorType(XmlAccessType.FIELD)
public class Book implements Serializable {

	private int id;
	private String title;
	private String userUsername;
	private String date;
	private String location;
	private String description;
	//private boolean open;
	private boolean reserved;
	

	@XmlElementWrapper
	@XmlElement(name = "reserve")
	private ArrayList<Reserve> reserves = new ArrayList<>();

	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(String title, String userUsername, String date, String location, String description,
			boolean reserved) {
		super();
		this.title = title;
		this.userUsername = userUsername;
		this.date = date;
		this.location = location;
		this.description = description;
		this.reserved = reserved;
		
	}

	public void addReserve(Reserve reserve) {
		reserves.add(reserve);
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

	public String getUserUsername() {
		return userUsername;
	}

	public void setUserUsername(String userUsername) {
		this.userUsername = userUsername;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public boolean isReserved() {
		return reserved;
	}

	public void setReserved(boolean reserved) {
		this.reserved = reserved;
	}



}
