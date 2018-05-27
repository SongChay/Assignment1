package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)

public class Reserve implements Serializable {
        
        
        private String rtitle;
	private String rname;
	private String remail;

	public Reserve() {
		// TODO Auto-generated constructor stub
	}

	public Reserve(String title, String name, String email) {
		super();
                this.rtitle= title;
		this.rname = name;
		this.remail = email;
	}

    public String getTitle() {
        return rtitle;
    }

    public void setTitle(String title) {
        this.rtitle = title;
    }

	public String getName() {
		return rname;
	}

	public void setName(String name) {
		this.rname = name;
	}

	public String getEmail() {
		return remail;
	}

	public void setEmail(String email) {
		this.remail = email;
	}

}
