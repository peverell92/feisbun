<%-- 
    Document   : index
    Created on : 16-dic-2012, 16:01:29
    Author     : Omar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if(session.getAttribute("username") !=  null){ //If there's a user logged in%>
<jsp:forward page="main.jsp"></jsp:forward>
<%} else {%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="StyleSheet" href="stylesheets/style.css" type="text/css">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
        <script src="signupboxevents.js"></script>
        <title>Feisbun</title>
    </head>
    <body>
        <div class="header-index">
            <div class="container">
                <div class="logo floatingblock"></div>
                <div class="login-form floatingblock">
                    <form action="j_signin.jsp" method="post">
                        <table class="login-info">
                            <tr><td>Email</td><td>Contraseña</td></tr>
                            <tr>
                                <td><input type="text" id="email-singin" name="email" class="inputbox"></td>
                                <td><input type="password" id="password-signin" name="password" class="inputbox"></td>
                            </tr>
                            <tr>
                                 <td><input type="checkbox" name="recordar" value="remmember">Recordarme</td>
                                 <td><button class="button" type="submit">Entrar</button></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="container">
                <div class="slogan floatingblock">
                    <p>feisbun.- Empresa imaginaria para un proyecto</p>
                </div>
                <div class="sign-up-form floatingblock">
                    <center><h2>!Registrate!</h2></center>
                    <center><h3>!Es gratis!</h3></center>
                    <div class="error-messages">
                        <%if(request.getParameter("db-error") != null){%>
                        <p class="errordb"><%=request.getParameter("db-error")%></p>
                        <%}%>
                        <p class="error emailmismatch">Los emails no coinciden</p>
                        <p class="error emptyfield">Hay uno o varios cuadros sin llenar</p>
                        <p class="error invalidemail">El email es invalido. Debe de terminar en <em>@feisbun.com</em></p>
                    </div>
                    <form action="j_signup.jsp" method="post" class="signup-form">
                        <table><tr><td>
                            <ul>
                                <li><input type="text" id="username" name="username" class="inputbox signupbox" data-default="1">
                                <li><input type="text" id="email" name="email" class="inputbox signupbox" data-default="1">
                                <li><input type="text" id="reemail" class="inputbox signupbox" data-default="1">
                                <li><input type="password" id="password" name="password" class="inputbox signupbox" data-default="1">
                                <li><p>Fecha de Nacimiento</p>
                                <li>
                                    <span>
                                        <select name="bday-day" data-default="0">
                                            <% for(int i=1;i<=31;i++){%>
                                                <option value="<%=i%>"><%=i%></option>
                                            <%}%>
                                        </select>
                                    </span>
                                    <span>
                                         <select name="bday-month" data-default="0">
                                            <option value="0">Enero</option>
                                            <option value="1">Febrero</option>
                                            <option value="2">Marzo</option>
                                            <option value="3">Abril</option>
                                            <option value="4">Mayo</option>
                                            <option value="5">Junio</option>
                                            <option value="6">Julio</option>
                                            <option value="7">Agosto</option>
                                            <option value="8">Septiembre</option>
                                            <option value="9">Octubre</option>
                                            <option value="10">Noviembre</option>
                                            <option value="11">Diciembre</option>
                                        </select>
                                    </span>
                                    <span>
                                        <select name="bday-year" data-default="0">
                                            <% for(int i=1970;i<=2013;i++){%>
                                                <option value="<%=i%>"><%=i%></option>
                                            <%}%>
                                        </select>
                                    </span>
                                </li>
                            </ul></td>
                            <td><ul>
                                <li><input type="text" id="phone" name="phone" class="inputbox signupbox" data-default="1">
                                <li><input type="text" id="address_street" name="address-street" class="inputbox signupbox" data-default="1">
                                <li><input type="text" id="address_colony" name="address-colony" class="inputbox signupbox" data-default="1">
                                <li><input type="text" id="address_city" name="address-city" class="inputbox signupbox" data-default="1">
                                <li><input type="text" id="address_state" name="address-state" class="inputbox signupbox" data-default="1">
                                <li><input type="text" id="school" name="school" class="inputbox signupbox" data-default="1">
                                <li><span>
                                        <p>Generación</p>
                                        <select name="school-generation" data-default="0">
                                            <% for(int i=1970;i<=2013;i++){%>
                                                <option value="<%=i%>"><%=i%></option>
                                            <%}%>
                                        </select>
                                    </span>
                                <li><input type="text" id="school-degree" name="school-degree" class="inputbox signupbox" data-default="1">
                                <li><span>
                                        <p>Area dentro de Feisbun,INC</p>
                                        <select name="area" data-default="0">
                                            <option value="Direccion General">Direccion General</option>
                                            <option value="Contabilidad">Contabilidad</option>
                                            <option value="Recursos Humanos">Recursos Humanos</option>
                                            <option value="Sistemas">Sistemas</option>
                                        </select>
                                    </span>

                                </ul></td></tr>
                        </table>
                        <center><button class="submit-button" type="submit">Registrarte</button></center>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
<%}%>