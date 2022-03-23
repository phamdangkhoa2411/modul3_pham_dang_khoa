package model;

public class TypeCustomer {
    private Integer idTypeCustomer;
    private String nameidTypeCustomer ;

    public TypeCustomer() {
    }

    public TypeCustomer(Integer idTypeCustomer, String nameidTypeCustomer) {
        this.idTypeCustomer = idTypeCustomer;
        this.nameidTypeCustomer = nameidTypeCustomer;
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
