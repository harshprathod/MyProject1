<%@ page import="java.util.List" %>
<%@ page import="com.entities.Notes" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="com.provider.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="alljs_css.jsp" %>
    <title>View Notes</title>
    <style>
        .note-card {
            margin-bottom: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .note-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }
        .card-img-top {
            transition: transform 0.3s;
        }
        .note-card:hover .card-img-top {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="navbar.jsp" %>
        <br>
        <h1>All NOTES</h1>

        <div class="row">
            <%
            try {
                Session ses = FactoryProvider.getFactory().openSession();
                Query q = ses.createQuery("from Notes");
                List<Notes> list = q.list();
                int count = 0; // Counter to keep track of cards per row

                for (Notes nt : list) {
                    if (count % 4 == 0) { // Start a new row for every 4 cards
            %>
            </div>
            <div class="row">
                <% } %>
                <div class="col-lg-3 col-md-4 col-sm-6"> <!-- Adjust column size based on your design -->
                    <div class="note-card">
                        <div class="card" style="max-width: 300px;">
                           <a href="viewnote.jsp?id=<%= nt.getId() %>" class="card-link">
                                <img src="img/notes.png" class="card-img-top" alt="Note Image">
                            </a>
                            <div class="card-body">
                                <h5 class="card-title"><%= nt.getTitle() %></h5>
                                <p class="card-text"><%= nt.getAddedDate() %></p>
                                <a href="editnote.jsp?note_id=<%=nt.getId()%>" class="btn btn-danger">Edit</a>
                                <a href="DeleteNoteServlet?note_id=<%=nt.getId()%>" class="btn btn-primary delete-btn" onclick="return confirm('Are you sure you want to delete this note?');">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
                <% 
                    count++;
                } // End for loop
                ses.close();
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
