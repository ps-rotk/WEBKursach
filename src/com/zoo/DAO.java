package com.zoo;

import java.sql.*;
import java.time.Instant;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    private Connection connection;

    public DAO() {
        connection = DBUtil.getConnection();
    }

    public String addFeed(Feed feed) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("INSERT INTO public.feed (title, count) values (?, ?)");
            preparedStatement.setString(1, feed.getTitle());
            preparedStatement.setInt(2, feed.getCount());
            preparedStatement.execute();
            return "Успешно";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка";
        }
    }

    public String addAnimal(Animal animal) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("INSERT INTO public.Animal (name, kind, age) " +
                            "values (?, ?, ?)");
            preparedStatement.setString(1, animal.getName());
            preparedStatement.setString(2, animal.getKind());
            preparedStatement.setInt(3, animal.getAge());
            preparedStatement.execute();
            return "Успешно";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка";
        }
    }

    public String addEmployer(Employer employer) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("INSERT INTO public." + "Employer" + "(fio, gender, birthdate) " +
                            "values (?, ?, ?)");
            preparedStatement.setString(1, employer.getFio());
            preparedStatement.setBoolean(2, employer.isMale());
            preparedStatement.setDate(3, Date.valueOf(employer.getBirthDate()));
            preparedStatement.execute();
            return "Успешно";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка";
        }
    }

    public String addAviary(Aviary aviary) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("INSERT INTO public.Aviary (title, size) " +
                            "values (?, ?)");
            preparedStatement.setString(1, aviary.getTitle());
            preparedStatement.setInt(2, aviary.getSize());
            preparedStatement.execute();
            return "Успешно";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка";
        }
    }

    public String deleteFeed(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from public.Feed where id_feed=?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            return "Успешно";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка";
        }
    }

    public String deleteAnimal(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from public.Animal where id_animal =?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            return "Успешно";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка";
        }
    }

    public String deleteAviary(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from public.Aviary where id_aviary=?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            return "Успешно";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка";
        }
    }

    public String deleteEmployer(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from public.Employer where id_employer=?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            return "Успешно";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка";
        }
    }

    public String updateFeed(Feed feed) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update Feed set title = ?, count = ? where id_feed = ?");
            preparedStatement.setString(1, feed.getTitle());
            preparedStatement.setInt(2, feed.getCount());
            preparedStatement.execute();
            return "Успешно";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка";
        }
    }

    public String updateAnimal(Animal animal) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update Animal set  name = ?,kind = ?, age = ? " +
                            "where id_animal = ?");
            preparedStatement.setString(1, animal.getName());
            preparedStatement.setString(2, animal.getKind());
            preparedStatement.setInt(3, animal.getAge());
            preparedStatement.setInt(4, animal.getIdAnimal());
            preparedStatement.execute();
            return "Успешно";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка";
        }
    }

    public String updateEmployer(Employer employer) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update public.employer set fio=?, gender=?, birthdate=? where  id_employer = ?");
            preparedStatement.setString(1, employer.getFio());
            preparedStatement.setBoolean(2, employer.isMale());
            preparedStatement.setDate(3, Date.valueOf(employer.getBirthDate()));
            preparedStatement.setInt(4, employer.getIdEmployer());
            preparedStatement.execute();
            return "Успешно";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка";
        }
    }

    public String updateAviary(Aviary aviary) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update public.Aviary set title=?,  size=? where  id_aviary = ?");
            preparedStatement.setString(1, aviary.getTitle());
            preparedStatement.setInt(2, aviary.getSize());
            preparedStatement.setInt(3, aviary.getIdAviary());
            preparedStatement.execute();
            return "Успешно";
        } catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка";
        }
    }

    public ArrayList<Feed> getAllFeeds() {
        ArrayList<Feed> feeds = new ArrayList<Feed>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from Feed");
            while (rs.next()) {
                Feed feed = new Feed();
                feed.setIdFeed(rs.getInt(1));
                feed.setTitle(rs.getString(2));
                feed.setCount(rs.getInt(3));
                feeds.add(feed);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feeds;
    }

    public ArrayList<Employer> getAllEmployers() {
        ArrayList<Employer> employers = new ArrayList<Employer>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from Employer");
            while (rs.next()) {
                Employer employer = new Employer();
                employer.setIdEmployer(rs.getInt(1));
                employer.setFio(rs.getString(2));
                employer.setGender(rs.getBoolean(3));
                Date date = rs.getDate(4);
                employer.setBirthDate(Instant.ofEpochMilli(date.getTime()).atZone(ZoneId.systemDefault()).toLocalDate());
                employers.add(employer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employers;
    }

    public ArrayList<Animal> getAllAnimals() {
        ArrayList<Animal> animals = new ArrayList<Animal>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from Animal");
            while (rs.next()) {
                Animal animal = new Animal();
                animal.setIdAnimal(rs.getInt(1));
                animal.setName(rs.getString(2));
                animal.setKind(rs.getString(3));
                animal.setAge(rs.getInt(4));
                animals.add(animal);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return animals;
    }

    public ArrayList<Aviary> getAllAviary() {
        ArrayList<Aviary> aviaries = new ArrayList<Aviary>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from Aviary");
            while (rs.next()) {
                Aviary aviary = new Aviary();
                aviary.setIdAviary(rs.getInt(1));
                aviary.setTitle(rs.getString(2));
                aviary.setSize(rs.getInt(3));
                aviaries.add(aviary);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return aviaries;
    }

    public Employer getEmployerById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from employer where id_employer=?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Employer employer = new Employer();
                employer.setIdEmployer(rs.getInt("id_employer"));
                employer.setFio(rs.getString("fio"));
                employer.setGender(rs.getBoolean("gender"));
                Date date = rs.getDate("birthdate");
                employer.setBirthDate(Instant.ofEpochMilli(date.getTime()).atZone(ZoneId.systemDefault()).toLocalDate());
                return employer;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Animal getAnimalById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from animal where id_animal=?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Animal animal = new Animal();
                animal.setIdAnimal(rs.getInt("id_animal"));
                animal.setName(rs.getString("name"));
                animal.setKind(rs.getString("kind"));
                animal.setAge(rs.getInt("age"));
                return animal;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Aviary getAviaryById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from aviary where id_aviary=?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Aviary aviary = new Aviary();
                aviary.setIdAviary(rs.getInt("id_aviary"));
                aviary.setTitle(rs.getString("title"));
                aviary.setSize(rs.getInt("size"));
                return aviary;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Feed getFeedById(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from feed where id_feed=?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Feed feed = new Feed();
                feed.setIdFeed(rs.getInt("id_feed"));
                feed.setTitle(rs.getString("title"));
                feed.setCount(rs.getInt("count"));
                return feed;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] arg) {
        DAO dao = new DAO();
        List<Animal> animals = dao.getAllAnimals();
        List<Employer> employers = dao.getAllEmployers();
        List<Aviary> avians = dao.getAllAviary();
        List<Feed> feeds = dao.getAllFeeds();
        for (Animal animal : animals) {
            System.out.println(animal);
        }
        for (Employer employer : employers) {
            System.out.println(employer);
        }
        for (Aviary aviary : avians) {
            System.out.println(aviary);
        }
        for (Feed feed : feeds) {
            System.out.println(feed);
        }

        dao.deleteAnimal(13);
        animals = dao.getAllAnimals();
        for (Animal animal : animals) {
            System.out.println(animal);
        }
    }
}

