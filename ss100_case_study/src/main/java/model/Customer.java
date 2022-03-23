package model;

public class Customer {
 private  Integer id;
 private String name;
 private String birthday;
 private Integer gender;
 private String idCard;
 private String phone;
 private String email ;
 private String address ;


 private Integer idTypeCustomer;
    private String nameidTypeCustomer;
    public Customer() {
    }

    public Customer(Integer id, String name, String birthday, Integer gender, String idCard, String phone, String email, String address, Integer idTypeCustomer, String nameidTypeCustomer) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.gender = gender;
        this.idCard = idCard;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.idTypeCustomer = idTypeCustomer;
        this.nameidTypeCustomer = nameidTypeCustomer;
    }

    public Customer(Integer id, String name,  String nameidTypeCustomer ,String birthday, Integer gender, String idCard, String phone, String email, String address) {
        this.id = id;
        this.name = name;
        this.nameidTypeCustomer = nameidTypeCustomer;
        this.birthday = birthday;
        this.gender = gender;
        this.idCard = idCard;
        this.phone = phone;
        this.email = email;
        this.address = address;

    }

    public Customer(String name, String birthday, Integer gender, String idCard, String phone, String email, String address, Integer idTypeCustomer) {

        this.name = name;
        this.birthday = birthday;
        this.gender = gender;
        this.idCard = idCard;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.idTypeCustomer = idTypeCustomer;
    }

    public Customer(Integer id, String name, String birthday, Integer gender, String idCard, String phone, String email, String address, Integer idTypeCustomer) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.gender = gender;
        this.idCard = idCard;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.idTypeCustomer = idTypeCustomer;
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birhtday) {
        this.birthday = birhtday;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getIdTypeCustomer() {
        return idTypeCustomer;
    }

    public void setIdTypeCustomer(Integer idTypeCustomer) {
        this.idTypeCustomer = idTypeCustomer;
    }

    public String getNameidTypeCustomer() {
        return nameidTypeCustomer;
    }

    public void setNameidTypeCustomer(String nameidTypeCustomer) {
        this.nameidTypeCustomer = nameidTypeCustomer;
    }
}
