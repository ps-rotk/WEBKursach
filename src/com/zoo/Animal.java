package com.zoo;

public class Animal {

    private int idAnimal;
    private String name;
    private String kind;
    private int age;

    public Animal(int idAnimal, String name, String kind, int age) {
        this.idAnimal = idAnimal;
        this.name = name;
        this.kind = kind;
        this.age = age;
    }

    public Animal(String name, String kind, int age) {
        this.name = name;
        this.kind = kind;
        this.age = age;
    }

    public Animal() {

    }

    public int getIdAnimal() {
        return idAnimal;
    }

    public void setIdAnimal(int idAnimal) {
        this.idAnimal = idAnimal;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Override
    public String toString() {
        return "Animal{" +
                "idAnimal=" + idAnimal +
                ", name='" + name + '\'' +
                ", kind='" + kind + '\'' +
                ", age=" + age +
                '}';
    }
}
