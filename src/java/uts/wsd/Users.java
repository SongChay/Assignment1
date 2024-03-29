package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "users", namespace = "http://www.uts.edu.au/31284/wsd-users")
public class Users implements Serializable {

    @XmlElement(name = "user")
    private ArrayList<User> list = new ArrayList<>();

    public Users() {
    }

    public void addUser(User user) {
        list.add(user);
    }

    //Check if user exists, compare username.
    public boolean userExists(String username) {
        for (User user : list) {
            if (user.getUsername().equals(username)) {
                return true;
            }
        }
        return false;
    }

    public User login(String username, String password) {
        for (User user : list) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }

    public ArrayList<User> getList() {
        return list;
    }

}
