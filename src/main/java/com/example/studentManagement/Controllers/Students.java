package com.example.studentManagement.Controllers;
import java.io.IOException;
import java.sql.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.studentManagement.DB.StudentDao;
import com.example.studentManagement.dao.StudentDaoHbnt;
import com.example.studentManagement.enums.BedType;
import com.example.studentManagement.models.Bed;
import com.example.studentManagement.models.Student;
/**
 * Servlet implementation class Students
 */
//@WebServlet("/")
public class Students extends HttpServlet{
    private static final long serialVersionUID = 1L;
    private StudentDaoHbnt studentDaoHbnt;
    private StudentDao studentDao;
    Connection connection=null;
    Statement select=null;
    public void init() {
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
        studentDaoHbnt=new StudentDaoHbnt();
        studentDao = new StudentDao(jdbcURL, jdbcUsername, jdbcPassword);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertStudent(request, response);
                    break;
                case "/delete":
                    deleteStudent(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateStudent(request, response);
                    break;
                case "/list" :
                    listStudent(request, response);
                case "/view":
                    viewStudent(request,response);
                default:
                    listStudent(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    private void listStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Student> listStudent = studentDao.listAllStudents();
        request.setAttribute("listStudent", listStudent);
        RequestDispatcher dispatcher = request.getRequestDispatcher("students.jsp");
        dispatcher.forward(request, response);
    }
    private void viewStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Student existingStudent = studentDao.getStudent(id);
        request.setAttribute("existingStudent", existingStudent);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewStudent.jsp");
        dispatcher.forward(request, response);

    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("add_student.jsp");
        dispatcher.forward(request, response);
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Student existingStudent = studentDao.getStudent(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("add_student.jsp");
        request.setAttribute("student", existingStudent);
        dispatcher.forward(request, response);
    }
    private void insertStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        Student newStudent = new Student(firstName, lastName, gender);
        Bed newBed=new Bed("0001", BedType.BUNK);
        Long bedId=studentDaoHbnt.saveBed(newBed);
        newBed.setId(bedId);

        Set<Bed> beds=new HashSet<Bed>();
        beds.add(newBed);
        newStudent.setBeds(beds);
//        studentDao.insertStudent(newStudent);
        studentDaoHbnt.saveStudent(newStudent);
        response.sendRedirect("list");
    }
    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("firstName");
        String author = request.getParameter("lastName");
        String gender = request.getParameter("gender");
        Student book = new Student(Long.valueOf(id), title, author, gender);
        studentDao.updateStudent(book);
        response.sendRedirect("list");
    }
    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        Long id = (long) Integer.parseInt(request.getParameter("id"));
        //Student book = new Student(Long.valueOf(id));
        //studentDao.deleteStudent(book);
        studentDaoHbnt.deleteStudent(id);
        response.sendRedirect("list");
    }
}