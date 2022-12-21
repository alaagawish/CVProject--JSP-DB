<%-- 
    Document   : home
    Created on : May 5, 2022, 7:57:59 AM
    Author     : LAPTOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Classification</title>
    </head>
    <body>

        <h1>Tables </h1>
        <%

            String URL = "jdbc:mysql://127.0.0.1:3306/mycvproject";
            String USER = "root";
            String PASSWORD = "root";
            String zagNum = "", englishSpeakerNum = "", webNum = "";
            Connection connection = null;
            Statement disp, dispp, disppp, dispweb, dispen, dispAll, dispA;

            ResultSet resultSet = null, rsZag = null, rr = null, rsWeb = null, rsEN = null, rsAll = null;

            try {
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
            } catch (SQLException ex) {
                ex.printStackTrace();

            }

            try {

                disp = connection.createStatement();
                dispp = connection.createStatement();
                disppp = connection.createStatement();
                dispen = connection.createStatement();
                dispweb = connection.createStatement();
                dispAll = connection.createStatement();
                dispA = connection.createStatement();

                disppp.executeUpdate("CREATE temporary TABLE  IF NOT EXISTS x AS (select * FROM mycvproject.person  where address='zag');");
                dispAll.executeUpdate("CREATE temporary TABLE  IF NOT EXISTS t AS (SELECT p.*,l.languageName,c.courseName,pr.projectName FROM (person p JOIN language l on l.person_idperson=p.idperson JOIN course c on c.person_idperson=p.idperson JOIN project pr on pr.person_idperson=p.idperson) where l.languageName='English');");

                resultSet = disp.executeQuery("select * from x;");
                rsAll = dispA.executeQuery("select * from t;");
                rsZag = dispp.executeQuery("SELECT COUNT(*) FROM x");
                rsWeb = dispweb.executeQuery("SELECT COUNT(*) FROM mycvproject.project where projectName='Web';");
                rsEN = dispen.executeQuery("SELECT COUNT(*) FROM mycvproject.language where languageName='English';");

                while (rsZag.next()) {
                    zagNum = rsZag.getString(1);

                }
                while (rsEN.next()) {
                    englishSpeakerNum = rsEN.getString(1);

                }
                while (rsWeb.next()) {
                    webNum = rsWeb.getString(1);

                }

            } catch (SQLException ex) {

                ex.printStackTrace();
            }


        %>
    <center>
        <form name="myform" action="index.jsp" method="POST">

            <table border="1"  style="width: 100%">

                <tbody>

                    <tr>
                        <td >No Of Persons in Zag</td>
                        <td ><%= zagNum%></td>
                    </tr>
                    <tr>
                        <td >No of Persons speak EN</td>
                        <td ><%= englishSpeakerNum%></td>
                    </tr>
                    <tr>
                        <td >no of web projects </td>
                        <td ><%= webNum%></td>
                    </tr>
                </tbody>
            </table>
            <h1>People live in Zag</h1>
            <table border="1"  style="width: 100%">

                <tbody>
                    <tr>
                        <TH>ID</TH>
                        <TH>First Name</TH>
                        <TH>Last Name</TH>
                        <TH>City</TH>
                        <TH>Address</TH>
                        <TH>Country</TH>
                        <TH>Email</TH>
                    </tr>
                    <% while (resultSet.next()) {%>
                    <tr>
                        <td> <%= resultSet.getString(1)%></td>
                        <td> <%= resultSet.getString(2)%></td>
                        <td> <%= resultSet.getString(3)%></td>
                        <td> <%= resultSet.getString(4)%></td>
                        <td> <%= resultSet.getString(5)%></td>
                        <td> <%= resultSet.getString(6)%></td>
                        <td> <%= resultSet.getString(7)%></td>
                    </tr>
                    <% }%>

                </tbody>
            </table>
            <h1>All info. speak English  </h1>
            <table border="1"  style="width: 100%">

                <tbody>
                    <tr>
                        <TH>ID</TH>
                        <TH>First Name</TH>
                        <TH>Last Name</TH>
                        <TH>City</TH>
                        <TH>Address</TH>
                        <TH>Country</TH>
                        <TH>Email</TH>
                        <TH>Language</TH>
                        <TH>Course</TH>
                        <TH>Project</TH>
                    </tr>
                    <% while (rsAll.next()) {%>
                    <tr>
                        <td> <%= rsAll.getString(1)%></td>
                        <td> <%= rsAll.getString(2)%></td>
                        <td> <%= rsAll.getString(3)%></td>
                        <td> <%= rsAll.getString(4)%></td>
                        <td> <%= rsAll.getString(5)%></td>
                        <td> <%= rsAll.getString(6)%></td>
                        <td> <%= rsAll.getString(7)%></td>
                        <td> <%= rsAll.getString(8)%></td>
                        <td> <%= rsAll.getString(9)%></td>
                        <td> <%= rsAll.getString(10)%></td>
                    </tr>
                    <% }%>

                </tbody>
            </table>


            <input  class ="btn" type="submit" value="Back" name="back" />

        </form>

    </center>
</body>
</html>
