package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;



@XmlAccessorType(XmlAccessType.FIELD)
public class Info implements Serializable {
        
     
        private String condition;
       
	private String userUsername;
       
	private boolean reserved;

	public Info() {
		
            
	}

	public Info(String condition, String userUsername, boolean reserved) {
		super();
         this.condition = condition;
        this.userUsername = userUsername;
        this.reserved = reserved;
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

	 public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

}
