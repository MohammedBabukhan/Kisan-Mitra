<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnector" %>
<%@ page import="javax.servlet.http.Part" %>
<%@ page import="javax.servlet.annotation.MultipartConfig" %>
<%@ page import="java.io.InputStream" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String commodity = request.getParameter("commodity");
    String origin = request.getParameter("origin");
    String quantity = request.getParameter("quantity");
    String price = request.getParameter("price");

    InputStream imageStream = null;
    Part imagePart = request.getPart("image");

    if (imagePart != null) {
        imageStream = imagePart.getInputStream();
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        conn = DBConnector.getConnection();
        String sql = "INSERT INTO tradecreation (commodity, origin, quantity, buyingprice, image) VALUES (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, commodity);
        pstmt.setString(2, origin);
        pstmt.setString(3, quantity);
        pstmt.setString(4, price);

        if (imageStream != null) {
            pstmt.setBlob(5, imageStream);
        } else {
            pstmt.setNull(5, java.sql.Types.BLOB);
        }

        int i = pstmt.executeUpdate();
        if (i > 0) {
            response.sendRedirect("thankyou.html");
        } else {
            out.println("Failed to insert record.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
    }
%>
