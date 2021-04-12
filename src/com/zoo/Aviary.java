package com.zoo;

public class Aviary {

    private int idAviary;
    private String title;
    private int size;

    public Aviary(int idAviary, String title, int size) {
        this.idAviary = idAviary;
        this.title = title;
        this.size = size;
    }

    public Aviary(String title, int size) {
        this.title = title;
        this.size = size;
    }

    public Aviary() {

    }

    public int getIdAviary() {
        return idAviary;
    }

    public void setIdAviary(int idAviary) {
        this.idAviary = idAviary;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "Aviary{" +
                "idAviary=" + idAviary +
                ", title='" + title + '\'' +
                ", size=" + size +
                '}';
    }
}
