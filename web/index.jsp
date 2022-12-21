<%--
    Document   : insert2databaseApplication
    Created on : Mar 17, 2018, 1:58:10 AM
    Author     : Khaled
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>my CV Project</title>
    </head>
    <body onload="displayResults()">
        <h1 id="nav" >MY CV PROJECT</h1>
        <%!
            public class CV {

                String URL = "jdbc:mysql://127.0.0.1:3306/mycvproject";
                String USER = "root";
                String PASSWORD = "root";
                int person_id = 0;
                Connection connection = null;
                PreparedStatement insertPerson = null;
                PreparedStatement courses = null;
                PreparedStatement projects = null;
                PreparedStatement sites = null;
                PreparedStatement languages = null;
                PreparedStatement apps = null;
                PreparedStatement hobbies = null;
                ResultSet resultSet = null;
                ResultSet rs = null;
                ResultSet rss = null;

                public CV() {

                    try {
                        connection = DriverManager.getConnection(URL, USER, PASSWORD);
                    } catch (SQLException ex) {
                        ex.printStackTrace();

                    }
                }

                public int insertPerson(String first, String last, String city, String address, String country, String email) {
                    int result = 0;

                    try {
                        insertPerson = connection.prepareStatement("INSERT INTO mycvproject.person (fName,lName,Address,city,country,email)"
                                + " VALUE (?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

                        if (first.length() != 0) {
                            insertPerson.setString(1, first);
                        }
                        if (last.length() != 0) {
                            insertPerson.setString(2, last);
                        }
                        if (city.length() != 0) {
                            insertPerson.setString(3, city);
                        }
                        if (address.length() != 0) {
                            insertPerson.setString(4, address);
                        }

                        if (country.length() != 0) {
                            insertPerson.setString(5, country);
                        }

                        if (email.length() != 0) {
                            insertPerson.setString(6, email);
                        }

                        result = insertPerson.executeUpdate();
                        rs = insertPerson.getGeneratedKeys();
                        if (rs.next()) {
                            person_id = rs.getInt(1);
                        }
                    } catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return result;
                }

                public int insertCourses(String firstC, String secondC, String thirdC, int id) {
                    int res = 0;

                    try {
                        courses = connection.prepareStatement("insert into mycvproject.course (courseName,person_idperson) value(?,?)");
                        courses.setInt(2, id);
                        if (firstC != "") {
                            courses.setString(1, firstC);
                            courses.executeUpdate();
                        }
                        if (secondC.length() != 0) {
                            courses.setString(1, secondC);
                            courses.executeUpdate();
                        }
                        if (thirdC.length() != 0) {
                            courses.setString(1, thirdC);
                            courses.executeUpdate();
                        }

                    } catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return res;
                }

                public int insertProjects(String firstP, String secondP, String thirdP, int id) {
                    int res1 = 0;

                    try {
                        projects = connection.prepareStatement("insert into mycvproject.project (projectName,person_idperson) value(?,?)");
                        projects.setInt(2, id);
                        if (firstP.length() != 0) {
                            projects.setString(1, firstP);
                            projects.executeUpdate();
                        }
                        if (secondP.length() != 0) {
                            projects.setString(1, secondP);
                            projects.executeUpdate();
                        }
                        if (thirdP.length() != 0) {
                            projects.setString(1, thirdP);
                            projects.executeUpdate();
                        }

                    } catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return res1;
                }

                public int insertLanguages(String firstL, String secondL, String thirdL, int id) {
                    int resLanguages = 0;

                    try {
                        languages = connection.prepareStatement("insert into mycvproject.language (languageName,person_idperson) value(?,?)");
                        languages.setInt(2, id);

                        if (firstL.length() != 0) {

                            languages.setString(1, firstL);
                            languages.executeUpdate();
                        }
                        if (secondL.length() != 0) {
                            languages.setString(1, secondL);
                            languages.executeUpdate();
                        }
                        if (thirdL.length() != 0) {
                            languages.setString(1, thirdL);
                            languages.executeUpdate();

                        }

                    } catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return resLanguages;
                }

                public int insertApps(String firstA, String secondA, String thirdA, int id) {
                    int resApps = 0;

                    try {
                        apps = connection.prepareStatement("insert into mycvproject.app (appName,person_idperson) value(?,?)");
                        apps.setInt(2, id);
                        if (firstA.length() != 0) {
                            apps.setString(1, firstA);
                            apps.executeUpdate();
                        }
                        if (secondA.length() != 0) {
                            apps.setString(1, secondA);
                            apps.executeUpdate();
                        }
                        if (thirdA.length() != 0) {
                            apps.setString(1, thirdA);
                            apps.executeUpdate();
                        }

                    } catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return resApps;
                }

                public int insertHobbies(String firstH, String secondH, String thirdH, int id) {
                    int resHobbies = 0;

                    try {
                        hobbies = connection.prepareStatement("insert into mycvproject.hobby (hobbyName,person_idperson) value(?,?)");
                        hobbies.setInt(2, id);
                        if (firstH.length() != 0) {
                            hobbies.setString(1, firstH);
                            hobbies.executeUpdate();
                        }
                        if (secondH.length() != 0) {
                            hobbies.setString(1, secondH);
                            hobbies.executeUpdate();
                        }
                        if (thirdH.length() != 0) {
                            hobbies.setString(1, thirdH);
                            hobbies.executeUpdate();
                        }

                    } catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return resHobbies;
                }

                public int insertSites(String firstS, String secondS, String thirdS, int id) {
                    int resSites = 0;

                    try {
                        sites = connection.prepareStatement("insert into mycvproject.project (siteAddress,person_idperson) value(?,?)");
                        sites.setInt(2, id);
                        if (firstS.length() != 0) {
                            sites.setString(1, firstS);
                            sites.executeUpdate();
                        }
                        if (secondS.length() != 0) {
                            sites.setString(1, secondS);
                            sites.executeUpdate();
                        }
                        if (thirdS.length() != 0) {
                            sites.setString(1, thirdS);
                            sites.executeUpdate();
                        }

                    } catch (SQLException ex) {

                        ex.printStackTrace();
                    }
                    return resSites;
                }

            }
        %>
        <%
            int result = 0, res = 0, res1 = 0;

            int resHobbies = 0, resLanguages = 0, resSite = 0, resApps = 0;
            if (request.getParameter("submit") != null) {
                result = 0;
                String firstName = "", lastName = "";
                String city = "", address = "", country = "", email = "";

                // to insert courses
                String firstC = "", secondC = "", thirdC = "";

                //to insert projects
                String firstP = "", secondP = "", thirdP = "";

                //to insert hobbies
                String firstH = "", secondH = "", thirdH = "";

                //to insert LANGAUAGES
                String firstL = "", secondL = "", thirdL = "";
                //to insert SITES
                String firstS = "", secondS = "", thirdS = "";

                //to insert APPS
                String firstA = "", secondA = "", thirdA = "";
                if (request.getParameter("first") != null) {

                    firstName = request.getParameter("first");
                }

                if (request.getParameter("last") != null) {
                    lastName = request.getParameter("last");
                }
                if (request.getParameter("city") != null) {
                    city = request.getParameter("city");
                }
                if (request.getParameter("address") != null) {
                    address = request.getParameter("address");
                }
                if (request.getParameter("country") != null) {
                    country = request.getParameter("country");
                }
                if (request.getParameter("email") != null) {
                    email = request.getParameter("email");
                }

                if (request.getParameter("firstC") != null) {
                    firstC = request.getParameter("firstC");
                }
                if (request.getParameter("secondC") != null) {
                    secondC = request.getParameter("secondC");
                }
                if (request.getParameter("thirdC") != null) {
                    thirdC = request.getParameter("thirdC");
                }

                //PROJECTS
                if (request.getParameter("firstP") != null) {
                    firstP = request.getParameter("firstP");
                }
                if (request.getParameter("secondP") != null) {
                    secondP = request.getParameter("secondP");
                }
                if (request.getParameter("thirdP") != null) {
                    thirdP = request.getParameter("thirdP");
                }

                //APPS
                if (request.getParameter("firstA") != null) {
                    firstA = request.getParameter("firstA");
                }
                if (request.getParameter("secondA") != null) {
                    secondA = request.getParameter("secondA");
                }
                if (request.getParameter("thirdA") != null) {
                    thirdA = request.getParameter("thirdA");
                }

                //LANGUAGES
                if (request.getParameter("firstL") != null) {
                    firstL = request.getParameter("firstL");

                }

                if (request.getParameter("secondL") != null) {
                    secondL = request.getParameter("secondL");
                }
                if (request.getParameter("thirdL") != null) {
                    thirdL = request.getParameter("thirdL");
                }

                //SITES
                if (request.getParameter("firstS") != null) {
                    firstS = request.getParameter("firstS");
                }
                if (request.getParameter("secondS") != null) {
                    secondS = request.getParameter("secondS");
                }
                if (request.getParameter("thirdS") != null) {
                    thirdS = request.getParameter("thirdS");
                }

                //hobbies
                if (request.getParameter("firstH") != null) {
                    firstH = request.getParameter("firstH");
                }
                if (request.getParameter("secondH") != null) {
                    secondH = request.getParameter("secondH");
                }
                if (request.getParameter("thirdH") != null) {
                    thirdH = request.getParameter("thirdH");
                }

                CV person = new CV();

                result = person.insertPerson(firstName, lastName, city, address, country, email);
                res = person.insertCourses(firstC, secondC, thirdC, person.person_id);
                res1 = person.insertProjects(firstP, secondP, thirdP, person.person_id);
                resHobbies = person.insertHobbies(firstH, secondH, thirdH, person.person_id);
                resSite = person.insertSites(firstS, secondS, thirdS, person.person_id);
                resLanguages = person.insertLanguages(firstL, secondL, thirdL, person.person_id);
                resApps = person.insertApps(firstA, secondA, thirdA, person.person_id);

            }
        %>
    <center>
        <form name="myForm" action="index.jsp" method="POST">

            <table border="0">

                <tbody>
                    <tr>
                        <td>First Name:</td>
                        <td><input class ="tb" type="text" name="first" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><input class ="tb" type="text" name="last" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>address:</td>
                        <td><input class ="tb" type="text" name="address" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>country:</td>
                        <td><select class ="tb" name="country">
                                <option>Egypt</option>
                                <option>England</option>
                                <option>US</option>
                                <option>Spain</option>
                                <option>Italy</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>city:</td>
                        <td><select class ="tb" name="city">
                                <option>Zag</option>
                                <option>Tgmo3</option>
                                <option>Belbis</option>
                                <option>Bnha</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>email:</td>
                        <td><input class ="tb" type="text" name="email" value="" size="50" /></td>
                    </tr>

                    <tr>
                        <td>Latest 3 projects:</td>
                        <td>
                            <select class ="tb" name="firstP" style="width: 100px">
                                <option></option>
                                <option>Web</option>
                                <option>Android</option>
                                <option>IOS</option>
                                <option>Embedded</option>
                                <option>Flutter</option>
                            </select>
                            <select class ="tb" name="secondP" style="width: 100px">
                                <option></option>
                                <option>Web</option>
                                <option>Android</option>
                                <option>IOS</option>
                                <option>Embedded</option>
                                <option>Flutter</option>
                            </select>
                            <select class ="tb" name="thirdP" style="width: 100px">
                                <option></option>
                                <option>Web</option>
                                <option>Android</option>
                                <option>IOS</option>
                                <option>Embedded</option>
                                <option>Flutter</option>
                            </select>

                        </td>

                    </tr>

                    <tr>
                        <td>Latest 3 courses:</td>
                        <td><input class ="tb"type="text" name="firstC" value="" size="50" />
                            <input class ="tb"type="text" name="secondC" value="" size="50" />
                            <input class ="tb" type="text" name="thirdC" value="" size="50" /></td>
                    </tr>

                    <tr>
                        <td>Languages:</td>
                        <td><select class ="tb" name="firstL" style="width: 100px">
                                <option></option>
                                <option>Arabic</option>
                                <option>English</option>
                                <option>French</option>
                                <option>German</option>
                                <option>Hindi</option>
                            </select>
                            <select class ="tb" name="secondL" style="width: 100px">
                                <option></option>
                                <option>English</option>
                                <option>Arabic</option>
                                <option>French</option>
                                <option>German</option>
                                <option>Hindi</option>
                            </select>
                            <select class ="tb" name="thirdL" style="width: 100px">
                                <option></option>
                                <option>French</option>
                                <option>Arabic</option>
                                <option>English</option>
                                <option>German</option>
                                <option>Hindi</option>
                            </select></td>
                    </tr>

                    <tr>
                        <td>Hobbies:</td>
                        <td><input class ="tb" type="text" name="firstH" value="" size="50" />
                            <input class ="tb" type="text" name="secondH" value="" size="50" />
                            <input class ="tb" type="text" name="thirdH" value="" size="50" /></td>
                    </tr>

                    <tr>
                        <td>Training:</td>
                        <td><input class ="tb" type="text" name="firstT" value="" size="50" />
                            <input class ="tb" type="text" name="secondT" value="" size="50" />
                            <input class ="tb" type="text" name="thirdT" value="" size="50" /></td>
                    </tr>

                </tbody>
            </table>
            <input  class ="btn" type="submit" value="Submit" name="submit" />

            <input class ="tb" type="hidden" name="hidden" value="<%= result%>" size="50" />
        </form>

    </center>

    <SCRIPT LANGUAGE="JavaScript">

        function displayResults() {
            if (document.myForm.hidden.value == 1) {
                alert("Thanks for inserting your Data");
                location.replace("http://localhost:8080/DBLab/home.jsp")
            }


        }

    </SCRIPT>
</body>
</html>
