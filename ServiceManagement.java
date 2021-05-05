package Lesson71;


import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import com.microsoft.sqlserver.jdbc.SQLServerException;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class ServiceManagement {
    private static final String USER_NAME = "sa";
    private static final String NAME_DB = "conductKaraoke";
    private static final int PORT = 1433;
    private static final String NAME_SERVER = "DESKTOP-7QK2KIP\\SQLEXPRESS";
    private static final String PASSWORD = "123";

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int option;
        do {
            System.out.println("****************************Option***************************");
            System.out.println("1.load Data From Database");
            System.out.println("2.Insert Data to Database");
            System.out.println("3.Update Data From Database");
            System.out.println("4.Delete Data From Database");
            System.out.println("your option ?");
            option = scanner.nextInt();
            switch (option) {
                case 0: {
                    System.out.println("exit");
                    break; 
                }
                case 1: {
                    int choose;
                    ArrayList<Service> services;
                    do {
                        System.out.println("*******************option***************");
                        System.out.println("1.load data by statement");
                        System.out.println("2.load data by prepareStatement");
                        System.out.println("0.return main menu");
                        System.out.println("you choose ?");
                        choose = scanner.nextInt();
                        if (choose == 0) break;

                        switch (choose) {
                            case 1: {
                                services = new ArrayList<>();
                                services = loadDataByStatement();
                                showInfo(services);
                                services.clear();
                                break;
                            }
                            case 2: {
                                services = new ArrayList<>();
                                services = loadDataByPreStatement();
                                showInfo(services);
                                services.clear();
                            }
                        }
                    } while (choose != 0);

                    break;
                }
                case 2: {
                    int choose;
                    ArrayList<Service> services;
                    do {
                        System.out.println("*******************option***************");
                        System.out.println("1.insert data by Statement");
                        System.out.println("2.insert data by prepareStatement");
                        System.out.println("0.return main menu");
                        System.out.println("you choose ?");
                        choose = scanner.nextInt();
                        if (choose == 0) break;

                        switch (choose) {
                            case 1: {
                                int result = insertDataByStatement();
                                if(result != -1){
                                    System.out.println("SUCCESS!");
                                }
                                else {
                                    System.out.println("FAIL!");
                                }
                                break;
                            }
                            case 2: {
                                Service service = new Service("SV9", "GOSAFE", "km", 200);
                                int result = insertDataByPrepareStatement(service);
                                if(result != -1){
                                    System.out.println("SUCCESS!");
                                }
                                else {
                                    System.out.println("FAIL!");
                                }
                                break;
                            }
                        }
                    } while (choose != 0);
                    break;
                }
                case 3: {
                    int choose;
                    do {
                        System.out.println("*******************option***************");
                        System.out.println("1.update data by statement");
                        System.out.println("2.update data by prepareStatement");
                        System.out.println("0.return main menu");
                        System.out.println("you choose ?");
                        choose = scanner.nextInt();
                        if (choose == 0) break;

                        switch (choose) {
                            case 1: {
                                int newBill = 200;
                                String idOfService = "SV8";
                                int result = UpdateDataByStatement(newBill, idOfService);
                                if(result != -1){
                                    System.out.println("SUCCESS!");
                                }
                                else {
                                    System.out.println("FAIL!");
                                }
                                break;
                            }
                            case 2: {
                                int newBill = 500;
                                String idOfService = "SV8";
                                int result = UpdateDataByPrepareStatement(newBill, idOfService);
                                if(result != -1){
                                    System.out.println("SUCCESS!");
                                }
                                else {
                                    System.out.println("FAIL!");
                                }
                                break;
                            }
                        }
                    } while (choose != 0);
                    break;
                }
                case 4: {
                    String idService = "SV9";
                    int result = deleteDataByPrepareStatement(idService);
                    if(result != -1){
                        System.out.println("SUCCESS!");
                    }
                    else {
                        System.out.println("FAIL!");
                    }
                    break;

                }
            }
        } while (option != 0);
    }

    private static int deleteDataByPrepareStatement(String idService) {
        var ds = config();
        try(var conn = ds.getConnection()) {
            var sql = "DELETE FROM dbo.addService WHERE idService ='" + idService + "'";
            var ps = conn.prepareStatement(sql);
            return ps.executeUpdate();
        } catch (SQLServerException e) {
            e.printStackTrace();
            return -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    private static int UpdateDataByPrepareStatement(int newBill, String idOfService) {
        var ds = config();
        try(var conn = ds.getConnection()) {
            var sql = "UPDATE dbo.addService SET bill = ? WHERE idService = ?";
            var ps = conn.prepareStatement(sql);
            ps.setInt(1, newBill);
            ps.setString(2, idOfService);
            return ps.executeUpdate();
        } catch (SQLServerException e) {
            e.printStackTrace();
            return -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    private static int UpdateDataByStatement(int newBill, String idOfService) {
        var ds = config();
        try(var conn = ds.getConnection()) {
            var sql = "UPDATE dbo.addService SET bill = " + newBill + "WHERE idService ='" + idOfService +"'";
            var st = conn.createStatement();
            return st.executeUpdate(sql);
        } catch (SQLServerException e) {
            e.printStackTrace();
            return -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    private static int insertDataByPrepareStatement(Service service) {
        var ds = config();
        try(var conn = ds.getConnection()){
            var sql = "INSERT INTO dbo.addService (idService, nameService, unit, bill) VALUES(?, ?, ? , ?)";
            var ps = conn.prepareStatement(sql);
            ps.setString(1, service.getIdService());
            ps.setString(2, service.getNameService());
            ps.setString(3, service.getUnit());
            ps.setInt(4, service.getBill());
            return ps.executeUpdate();
        } catch (SQLServerException e) {
            e.printStackTrace();
            return -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    private static int insertDataByStatement() {
        var ds = config();
        try(var conn = ds.getConnection()){
            var sql = "INSERT INTO dbo.addService (idService, nameService, unit, bill) VALUES('SV9', 'GO SAFE', 'KM', 200)";
            var st = conn.createStatement();
            return st.executeUpdate(sql);
        } catch (SQLServerException e) {
            e.printStackTrace();
            return -1;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    private static ArrayList<Service> loadDataByPreStatement() {
        ArrayList<Service> services = new ArrayList<>();
        var ds = config();
        try (var conn = ds.getConnection()) {
            var sql = "SELECT * FROM dbo.addService";
            var ps = conn.prepareStatement(sql);
            var result = ps.executeQuery();
            while (result.next()) {
                String idService = result.getString(1);
                String nameService = result.getString(2);
                String unit = result.getString(3);
                int bill = result.getInt(4);
                var service = new Service(idService, nameService, unit, bill);
                services.add(service);
            }
        } catch (SQLServerException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }

    private static void showInfo(ArrayList<Service> services) {
        System.out.printf("%-20s%-20s%-20s%-20s\n", "idService", "nameService", "unit", "bill");
        for (var service : services) {
            System.out.printf("%-20s%-20s%-20s%-20s\n",
                    service.getIdService(), service.getNameService(), service.getUnit(), service.getBill());
        }
    }

    private static ArrayList<Service> loadDataByStatement() {
        ArrayList<Service> services = new ArrayList<>();
        var ds = config();
        try (var conn = ds.getConnection()) {
            var sql = "SELECT * FROM dbo.addService";
            var st = conn.createStatement();
            var result = st.executeQuery(sql);
            while (result.next()) {
                String idService = result.getString(1);
                String nameService = result.getString(2);
                String unit = result.getString(3);
                int bill = result.getInt(4);
                var service = new Service(idService, nameService, unit, bill);
                services.add(service);
            }
        } catch (SQLServerException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }

    public static SQLServerDataSource config() {
        SQLServerDataSource ds = new SQLServerDataSource();
        ds.setServerName(NAME_SERVER);
        ds.setPortNumber(PORT);
        ds.setDatabaseName(NAME_DB);
        ds.setPassword(PASSWORD);
        ds.setUser(USER_NAME);
        return ds;
    }


}
