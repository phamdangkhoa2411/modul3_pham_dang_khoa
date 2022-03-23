package model;

public class Product {
    private int id;
    private String name;
    private double price;
    private int quanlity;
    private String color;
    private int idCategory;
    private String nameCategory;

    public Product() {
    }

    public Product(int id, String name, double price, int quanlity, String color, int idCategory, String nameCategory) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quanlity = quanlity;
        this.color = color;
        this.idCategory = idCategory;
        this.nameCategory = nameCategory;
    }

    public Product(int id, String name, double price, int quanlity, String color, String nameCategory) {

        this.id = id;
        this.name = name;
        this.price = price;
        this.quanlity = quanlity;
        this.color = color;
        this.nameCategory = nameCategory;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuanlity() {
        return quanlity;
    }

    public void setQuanlity(int quanlity) {
        this.quanlity = quanlity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }
}
