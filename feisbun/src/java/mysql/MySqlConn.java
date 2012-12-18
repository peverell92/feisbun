/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mysql;
//MySql
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySqlConn {

    public Statement stmt = null;
    public ResultSet rs = null;
    public Connection conn = null;

    public MySqlConn() {
        //Connect();
    }

    public void Connect() {
        //Conectar con mysql...
        String connectionUrl = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //connectionUrl = "jdbc:mysql://localhost/demo?user=root&password=root";
            connectionUrl = "jdbc:mysql://localhost/feisbun?user=omar&password=garcia";
            conn = DriverManager.getConnection(connectionUrl);
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.toString());
        } catch (ClassNotFoundException cE) {
            System.out.println("Class Not Found Exception: "
                    + cE.toString());
        }
    }

    public int signup(String username, String password, Date birthdate, String phone,
            String street, String colony, String city, String state, String school, String school_gen,
            String school_degree, String area, String email) {
        PreparedStatement ps = null;
        int rModif = 0;
        initConnection();
        try {
            ps = conn.prepareStatement("INSERT INTO users(username,password,birthday,phone,address_street,address_colony,address_city,address_state,school,school_generation,school_degree,area,online,administrator,email) VALUES (?,MD5(?),?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setDate(3, birthdate);
            ps.setString(4, phone);
            ps.setString(5, street);
            ps.setString(6, colony);
            ps.setString(7, city);
            ps.setString(8, state);
            ps.setString(9, school);
            ps.setString(10, school_gen);
            ps.setString(11, school_degree);
            ps.setString(12, area);
            ps.setString(13, "0");
            ps.setBoolean(14, false);
            ps.setString(15, email);
            rModif = ps.executeUpdate();
        } catch (SQLException ex) {
            printErrors(ex);
        }
        return rModif;
    }

    public int hasUniqueEmail(String email) {
        PreparedStatement ps = null;
        rs = null;
        int r = 0;
        initConnection();
        try {
            ps = conn.prepareStatement("SELECT * FROM users WHERE email=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            rs.first();
            r = rs.getRow();
        } catch (SQLException ex) {
            printErrors(ex);
        }
        return r;
    }

    public void signin(String email, String password) {
        PreparedStatement ps = null;
        rs = null;
        initConnection();
        try {
            ps = conn.prepareStatement("SELECT * FROM users WHERE email=? AND password=MD5(?)");
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            rs.first();
        } catch (SQLException ex) {
            printErrors(ex);
        }
    }

    public void signinQuery(String username, String password) {
        PreparedStatement ps = null;
        initConnection();
        try {
            ps = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=MD5(?) ");
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            rs.first();
        } catch (SQLException ex) {
            printErrors(ex);
        }
    }

    public void getCommentsFrom(String email) {
        PreparedStatement ps = null;
        initConnection();
        try {
            ps = conn.prepareStatement("SELECT * FROM comments WHERE user_to=?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            rs.afterLast();
        } catch (SQLException ex) {
            printErrors(ex);
        }
    }

    public int sendComment(String user_from, String user_to, String text_content) {
        //TODO
        //Se necesita poder subir imagenes
        PreparedStatement ps = null;
        int r = 0;
        initConnection();
        try {
            ps = conn.prepareStatement("INSERT INTO comments(user_from,user_to,text_content,sent_at) VALUES(?,?,?,CURDATE())");
            ps.setString(1, user_from);
            ps.setString(2, user_to);
            ps.setString(3, text_content);
            r = ps.executeUpdate();
        } catch (SQLException ex) {
            printErrors(ex);
        }
        return r;
    }

    public void markOnline(String email) {
        PreparedStatement ps = null;
        initConnection();
        try {
            ps = conn.prepareStatement("UPDATE users SET online=TRUE WHERE email=?");
            ps.setString(1, email);
            ps.executeUpdate();
        } catch (SQLException ex) {
            printErrors(ex);
        }
    }

    public void markOffline(String email) {
        PreparedStatement ps = null;
        initConnection();
        try {
            ps = conn.prepareStatement("UPDATE users SET online=FALSE WHERE email=?");
            ps.setString(1, email);
            ps.executeUpdate();
        } catch (SQLException ex) {
            printErrors(ex);
        }
    }

    public void getNameFrom(String user) {
        PreparedStatement ps = null;
        rs = null;
        initConnection();
        try {
            ps = conn.prepareStatement("SELECT username FROM users WHERE email=?");
            ps.setString(1, user);
            rs = ps.executeQuery();
            rs.first();
        } catch (SQLException ex) {
            printErrors(ex);
        }
    }

    public void allows(String username, String allows_from) {
        PreparedStatement ps = null;
        rs = null;
        initConnection();
        try {
            ps = conn.prepareStatement("SELECT * FROM allows WHERE username=? AND allows_from=?");
            ps.setString(1, username);
            ps.setString(2, allows_from);
            rs = ps.executeQuery();
            rs.first();
        } catch (SQLException ex) {
            printErrors(ex);
        }
    }

    public int sendRequest(String to_user, String from_user) {
        PreparedStatement ps = null;
        int r = 0;
        initConnection();
        try {
            ps = conn.prepareStatement("INSERT INTO requests(username,request_from) VALUES(?,?)");
            ps.setString(1, to_user);
            ps.setString(2, from_user);
            r = ps.executeUpdate();
        } catch (SQLException ex) {
            printErrors(ex);
        }
        return r;
    }

    public void getRequestsFrom(String username) {
        PreparedStatement ps = null;
        rs = null;
        initConnection();
        try {
            ps = conn.prepareStatement("SELECT * FROM requests WHERE username=?");
            ps.setString(1, username);
            rs = ps.executeQuery();
            rs.beforeFirst();
        } catch (SQLException ex) {
            printErrors(ex);
        }
    }
    
    public int removeRequest(String username, String request_from){
        PreparedStatement ps = null;
        int r = 0;
        initConnection();
        try {
            ps = conn.prepareStatement("DELETE FROM requests WHERE username=? AND request_from=?");
            ps.setString(1, username);
            ps.setString(2, request_from);
            r = ps.executeUpdate();
        } catch (SQLException ex) {
            printErrors(ex);
        }
        return r;
    }

    public int allowUpdate(String username, String allow_from){
        PreparedStatement ps = null;
        int r = 0;
        initConnection();
        try {
            ps = conn.prepareStatement("INSERT INTO allows(username,allows_from) VALUES(?,?)");
            ps.setString(1, username);
            ps.setString(2, allow_from);
            r = ps.executeUpdate();
        } catch (SQLException ex) {
            printErrors(ex);
        }
        return r;
    }
    
    public void Consult(String query) {
        initConnection();
        //consulta...
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            if (stmt.execute(query)) {
                rs = stmt.getResultSet();
                rs.first();
            }

        } catch (SQLException ex) {
            printErrors(ex);
        }


    }

    public int Update(String query) {
        int rModif = 0;
        initConnection();

        try {
            stmt = conn.createStatement();
            rModif = stmt.executeUpdate(query);

        } catch (SQLException ex) {
            printErrors(ex);
        }

        return rModif;
    }

    public void closeRsStmt() {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException sqlEx) {
            } // ignore
            rs = null;
        }

        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException sqlEx) {
            } // ignore
            stmt = null;
        }
    }

    public void desConnect() {
        closeRsStmt();
        try {
            conn.close();
        } catch (SQLException ex) {
        }
    }

    public String[][] getRSfromQuery(String query) {
        initConnection();
        String resultSet[][] = null;
        //consulta...
        try {

            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            if (stmt.execute(query)) {
                rs = stmt.getResultSet();
                rs.first();
            }

            rs.last();
            int n = rs.getRow();
            rs.first();

            resultSet = new String[n][5];
            for (int i = 0; i < resultSet.length; i++) {
                for (int j = 0; j < resultSet[i].length; j++) {
                    resultSet[i][j] = rs.getString(j + 1);
                }
                rs.next();
            }

        } catch (SQLException ex) {
            printErrors(ex);
        }
        return resultSet;
    }

    private void initConnection() {
        try {
            if (conn == null) {
                Connect();
            } else {
                if (conn.isClosed()) {
                    Connect();
                }
            }
        } catch (SQLException ex) {
        }
    }

    private void printErrors(SQLException ex) {
        System.out.println("SQLException: " + ex.getMessage());
        System.out.println("SQLState: " + ex.getSQLState());
        System.out.println("Error: " + ex.getErrorCode());
    }
}


/*
 *148.211.152.233
 * String connectionUrl = "jdbc:mysql://localhost/consultorio?"
                    +"user=root&password=lircla";

 */