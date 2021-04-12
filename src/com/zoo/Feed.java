package com.zoo;

public class Feed {

    private int idFeed;
    private String title;
    private int count;

    public Feed(int idFeed, String title, int count) {
        this.idFeed = idFeed;
        this.title = title;
        this.count = count;
    }

    public Feed(String title, int count) {
        this.title = title;
        this.count = count;
    }

    public Feed() {

    }

    public int getIdFeed() {
        return idFeed;
    }

    public void setIdFeed(int idFeed) {
        this.idFeed = idFeed;
    }

    public String getTitle() {
        return title;
    }

    @Override
    public String toString() {
        return "Feed{" +
                "idFeed=" + idFeed +
                ", title='" + title + '\'' +
                ", count=" + count +
                '}';
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
