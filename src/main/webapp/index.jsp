<%@ page import="java.util.List" %>
<%@ page import="com.entities.Notes" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="com.provider.FactoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Notes Tracker</title>
    <%@ include file="alljs_css.jsp" %>
    <style>
        .jumbotron-custom {
            position: relative;
            background-image: url('img/backgroundimg.jpeg'); /* Path to your background image */
            background-size: cover; /* Make the background cover the entire jumbotron */
            background-position: center; /* Center the background image */
            color: white; /* Text color to make it readable */
            padding: 60px 20px; /* Add some padding */
            border-radius: 10px; /* Optional: rounded corners */
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.7); /* Add a subtle text shadow for readability */
        }

        .jumbotron-custom::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Dark overlay with transparency */
            z-index: 1; /* Place the overlay behind the text */
            border-radius: 10px; /* Optional: rounded corners */
        }

        .jumbotron-custom .content {
            position: relative;
            z-index: 2; /* Place the text above the overlay */
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="navbar.jsp" %>

        <div class="jumbotron jumbotron-custom text-center mt-4">
            <div class="content">
                <h1 class="display-4">Welcome to Notes Tracker</h1>
                <p class="lead">Organize your notes efficiently and access them anywhere, anytime.</p>
                <a href="AddNote.jsp" class="btn btn-primary btn-lg">Add a New Note</a>
            </div>
        </div>

        <h2 class="text-center mb-4">Recent Notes</h2>

        <div class="row">
            <%
            // Fetch recent notes from the database
            try {
                Session ses = FactoryProvider.getFactory().openSession();
                Query query = ses.createQuery("from Notes order by addedDate desc");
                query.setMaxResults(8); // Show only the most recent 8 notes
                List<Notes> recentNotes = query.list();
                
                for (Notes note : recentNotes) {
            %>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="card card-custom">
                    <a href="viewnote.jsp?id=<%= note.getId() %>" class="card-link">
                        <img src="img/notes.png" class="card-img-top" alt="Note Image">
                    </a>
                    <div class="card-body">
                        <h5 class="card-title"><%= note.getTitle() %></h5>
                        <p class="card-text">
                            <%= note.getContent().length() > 100 ? note.getContent().substring(0, 100) + "..." : note.getContent() %>
                        </p>
                        <a href="editnote.jsp?note_id=<%= note.getId() %>" class="btn btn-danger">Edit</a>
                        <a href="DeleteNoteServlet?note_id=<%= note.getId() %>" class="btn btn-primary" onclick="return confirm('Are you sure you want to delete this note?');">Delete</a>
                    </div>
                </div>
            </div>
            <% 
                }
                ses.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
                e.printStackTrace();
            }
            %>
        </div>

        <footer class="text-center mt-4">
            <p>&copy; 2024 Notes Tracker. All Rights Reserved.</p>
        </footer>
    </div>
</body>
</html>
