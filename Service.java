package Lesson71;

public class Service {
    private String idService;
    private String nameService;
    private String unit;
    private int bill;


    public Service(String idService, String nameService, String unit, int bill) {
        this.idService = idService;
        this.nameService = nameService;
        this.unit = unit;
        this.bill = bill;
    }

    public String getIdService() {
        return idService;
    }

    public void setIdService(String idService) {
        this.idService = idService;
    }

    public String getNameService() {
        return nameService;
    }

    public void setNameService(String nameService) {
        this.nameService = nameService;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getBill() {
        return bill;
    }

    public void setBill(int bill) {
        this.bill = bill;
    }

    @Override
    public String toString() {
        return "Service{" +
                "idService='" + idService + '\'' +
                ", nameService='" + nameService + '\'' +
                ", unit='" + unit + '\'' +
                ", bill=" + bill +
                '}';
    }
}
