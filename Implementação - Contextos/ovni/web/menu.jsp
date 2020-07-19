<%-- 
    Document   : menu
    Created on : 24/04/2008, 20:04:55
    Author     : Leo
--%>


<%@ page import="java.util.*,java.sql.*,java.io.*,ovni.util.*" %>
<%
            int iTipo = 0;
            if (request.getParameter("tipo") != null) {
                iTipo = Integer.parseInt(request.getParameter("tipo"));
            }

            ResultSet rsItensMenu = Menu.ItensMenu(iTipo);
%>

           <ul>
                <%
            while (rsItensMenu.next()) {

                %>
                <li>
                    <%if (rsItensMenu.getShort("nivel") == 1) {%>
                    <br/><h1><a href="/ovni/MontarVitrine?tipo=<%= rsItensMenu.getInt("tipoproduto")%>"><%= rsItensMenu.getString("descricao")%></a></h1>
                    <%} else {
                    %>
                    <img src="styles/imgs/img_lista.gif"><a href="/ovni/MontarVitrine?genero=<%= rsItensMenu.getInt("genero")%>&tipo=<%= rsItensMenu.getInt("tipoproduto")%>"><%= rsItensMenu.getString("descricao")%></a>
                    <%}%>
                </li>               
                <%  }%>
            </ul>   
