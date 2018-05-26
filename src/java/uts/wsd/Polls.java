package uts.wsd;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Polls implements Serializable {

    @XmlElement(name = "poll")
    private ArrayList<Poll> list = new ArrayList<>();

    public Polls() {
        // TODO Auto-generated constructor stub
    }

    public ArrayList<Poll> getOpenPolls() {
        ArrayList<Poll> openPolls = new ArrayList<>();
        for (Poll poll : list) {
            if (poll.isOpen()) {
                openPolls.add(poll);
            }
        }
        return openPolls;
    }

    public ArrayList<Poll> getPollByCreator(String username) {
        ArrayList<Poll> polls = new ArrayList<>();
        for (Poll poll : list) {
            if (poll.getCreatorUsername().equals(username)) {
                polls.add(poll);
            }
        }
        return polls;
    }

    public void addPoll(Poll poll) {
        list.add(poll);
    }

    public Poll removePoll(String title) {
        
        //Iterators allow the caller to remove elements from the underlying collection during the iteration with well-defined semantics.
        Iterator<Poll> iter = list.iterator();
        while (iter.hasNext()) {
            Poll poll = iter.next();

            if (poll.getTitle().equals(title)) {
                iter.remove();
            }
        }

        //for (Poll p : list) {
        //   if (p.getTitle().equals(title)) {
        //        list.remove(p);
        //   }
        //} 
        return null;
    }

    public ArrayList<Poll> getList() {
        return list;
    }

    public Poll findPoll(String title) {

        for (Poll poll : list) {
            if (poll.getTitle().equals(title)) {
                return poll;
            }
        }
        return null;
    }
}
