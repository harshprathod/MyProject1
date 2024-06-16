<%@ page import="com.entities.Notes" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.provider.FactoryProvider" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="alljs_css.jsp" %>
    <title>Edit Note</title>
</head>
<body>
    <div class="container">
        <%@ include file="navbar.jsp" %>
        <br>
        <h1>Edit Note</h1>

        <div class="row">
            <div class="col-lg-8 offset-lg-2"> <!-- Adjust column size based on your design -->
                <%
                try {
                    // Retrieve note ID from query parameter
                    String noteIdParam = request.getParameter("note_id");
                    if (noteIdParam != null && !noteIdParam.isEmpty()) {
                        int noteId = Integer.parseInt(noteIdParam.trim());

                        // Open Hibernate session and retrieve note by ID
                        Session ses = FactoryProvider.getFactory().openSession();
                        Notes note = ses.get(Notes.class, noteId);

                        // Display form to edit note
                        if (note != null) {
                %>
                <form action="UpdateNoteServlet" method="post">
                    <input type="hidden" name="noteid" value="<%= note.getId() %>">
                    <div class="form-group">
                        <label for="title">Note Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="<%= note.getTitle() %>">
                    </div>
                    <div class="form-group">
                        <label for="content">Note Content</label>
                        <textarea class="form-control" id="content" name="content" rows="5"><%= note.getContent() %></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Update Note</button>
                    <a href="allnotes.jsp" class="btn btn-secondary">Cancel</a>
                </form>
                <% } else { %>
                <div class="alert alert-danger" role="alert">
                    Note not found.
                </div>
                <% }
                    ses.close();
                } else {
                %>
                <div class="alert alert-danger" role="alert">
                    Note ID parameter is missing or empty.
                </div>
                <% }
                } catch (NumberFormatException e) {
                %>
                <div class="alert alert-danger" role="alert">
                    Invalid note ID parameter.
                </div>
                <% e.printStackTrace();
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
