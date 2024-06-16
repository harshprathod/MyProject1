<%@ page import="com.entities.Notes" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.provider.FactoryProvider" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="alljs_css.jsp" %>
    <title>View Note</title>
</head>
<body>
    <div class="container">
        <%@ include file="navbar.jsp" %>
        <br>
        <h1>Note Details</h1>

        <div class="row">
            <div class="col-lg-8 offset-lg-2"> <!-- Adjust column size based on your design -->
                <%
                try {
                    // Retrieve note ID from query parameter
                    int noteId = Integer.parseInt(request.getParameter("id"));

                    // Open Hibernate session and retrieve note by ID
                    Session ses = FactoryProvider.getFactory().openSession();
                    Notes note = ses.get(Notes.class, noteId);
                    ses.close();

                    // Display note details
                    if (note != null) {
                %>
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= note.getTitle() %></h5>
                        <p class="card-text"><%= note.getContent() %></p>
                        <p class="card-text">Added on: <%= note.getAddedDate() %></p>
                        <!-- Display other details as needed -->
                    </div>
                </div>
                <% } else { %>
                <div class="alert alert-danger" role="alert">
                    Note not found.
                </div>
                <% } %>
                <br>
                <a href="allnotes.jsp" class="btn btn-primary">Back to All Notes</a>
                <!-- Link to go back to the main notes listing page -->
                <%
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                    e.printStackTrace();
                }
                %>
            </div>
        </div>

    </div>
</body>
</html>
