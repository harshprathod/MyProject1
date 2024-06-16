package com.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.provider.FactoryProvider;


/**
 * Servlet implementation class SaveNoteServlet
 */
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			// creatring notes object 
			Notes note = new Notes(title,content,new Date());
			System.out.println("Saving a new Note .. id : "+note.getId() +" name "+note.getTitle());
			
			Session session =FactoryProvider.getFactory().openSession();
			System.out.println("begin Transaction...");
			Transaction tx = session.beginTransaction();
			System.out.println("Save New Note.."+note.getId());
			session.save(note);
			System.out.println("Commit Changes");
			tx.commit();	
			session.close();
			
			PrintWriter pw = response.getWriter();
			pw.println("<h1 style='text-align:center;'> Note added successfully</h1>");
			pw.println("<h1 style='text-align:center;'><a href ='allnotes.jsp'>View All Notes</a></h1>");
		} catch (Exception es) {
			es.printStackTrace();
		}

	}

}
