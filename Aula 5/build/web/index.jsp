<%-- 
    Document   : index
    Created on : 21/09/2020, 21:19:33
    Author     : qintess
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.fatecpg.poo.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<User> usuarios = (ArrayList) application.getAttribute("usuarios");

    if (usuarios == null) {
        usuarios = new ArrayList();
        application.setAttribute("usuarios", usuarios);
    }
    if (request.getParameter("cadastrar") != null) {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");

        usuarios.add(new User(nome, telefone, email));
        response.sendRedirect(request.getRequestURI());
    }

    if (request.getParameter("remover") != null) {
        int i = Integer.parseInt(request.getParameter("i"));

        usuarios.remove(i);
        response.sendRedirect(request.getRequestURI());
    }


%>
<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="GET" class="forms">
            <h1>Cadastro</h1>
            <h3>Nome:</h3>
            <input type="text" name="nome" required="true"\>
            <h3>Telefone:</h3>
            <input type="text" name="telefone" required="true"\>
            <h3>Email:</h3>
            <input type="text" name="email" required="true"\>
            <br>
            <button type="submit" name="cadastrar">Cadastrar</button>
            <br>
        </form> 

        <%if (usuarios.size() > 0) {%>
        <div class="tabela">
            <table border="2" width="80%" bordercolor="blue">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th></th>
                </tr>

                <%
                    for (int u = 0;
                            u < usuarios.size();
                            u++) {%>

                <% User usuario = usuarios.get(u);%>
                <tr>
                    <td><%= u + 1%></td>
                    <td><%= usuario.getNome()%></td>
                    <td><%= usuario.getEmail()%></td>
                    <td><%= usuario.getTelefone()%></td>
                    <td>
                        <form>
                            <button class="remover" type="submit" name="remover">Remover</button>
                            <input type="hidden" name="i" value="<%= u%>"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
        <%} else {

                out.println("<h2 class='aviso'>Sem contatos</h2>");

            }
        %>
    </body>
</html>
