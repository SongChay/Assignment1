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

public class UserApplication implements Serializable {

    private String userFilePath;
    private Users users;

    public UserApplication() {
        // TODO Auto-generated constructor stub
    }

    public String getUserFilePath() {
        return userFilePath;
    }

    public void setUserFilePath(String userFilePath) throws JAXBException, IOException {
        this.userFilePath = userFilePath;

        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Unmarshaller u = jc.createUnmarshaller();

        FileInputStream fin = new FileInputStream(userFilePath);
        users = (Users) u.unmarshal(fin);
        fin.close();
    }

    public void save() throws JAXBException, FileNotFoundException {
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        m.marshal(users, new FileOutputStream(userFilePath));
    }

    public void updateXML(Users users, String userFilePath) throws Exception {
        this.users = users;
        this.userFilePath = userFilePath;

        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(userFilePath);
        m.marshal(users, fout);
        fout.close();
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
}
