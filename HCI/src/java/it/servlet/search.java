/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.servlet;

import it.bean.ItemBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 1
 */
@WebServlet(name = "search", urlPatterns = {"/search"})
public class search extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if ("apple".equalsIgnoreCase(action)) {
            String search = request.getParameter("search");
            String checkPrice = request.getParameter("price");
            if (checkPrice == null) {
                checkPrice = "0,9999";
            }
            String[] parts = checkPrice.split(",");
            int min = Integer.parseInt(parts[0]);
            int max = Integer.parseInt(parts[1]);
            ArrayList items = new ArrayList();
            String[] id = {"A001", "A002", "A003", "A004", "A005", "A006", "A007", "A008"};
            String[] name = {"Iphone 5", "Iphone 5s", "Iphone 6", "Iphone 6s", "Iphone 6s plus", "Iphone se", "Iphone 7", "Iphone 7plus"};
            String[] description = {"Iphone5 is good", "Iphone5s is nice", "Iphone6 is cheap", "Iphone6s is nice", "Iphone6s plus is good", "Iphone se is cheap", "Iphone7 is good", "Iphone7 plus is nice"};
            int[] available = {2, 4, 6, 8, 8, 6, 4, 2};
            int[] price = {500, 600, 800, 900, 1200, 1400, 1600, 2000};
            String[] img = {"img/apple/i5.jpg", "img/apple/5s.jpeg", "img/apple/i6.png", "img/apple/6s.jpg", "img/apple/6sp.png", "img/apple/se.jpg", "img/apple/i7.jpg", "img/apple/7p.jpg"};
            for (int i = 0; i < name.length; i++) {
                if (name[i].toLowerCase().contains(search.toLowerCase()) && price[i] >= min && price[i] <= max) {
                    ItemBean ib = new ItemBean();
                    ib.setId(id[i]);
                    ib.setName(name[i]);
                    ib.setDescription(description[i]);
                    ib.setAvailable(available[i]);
                    ib.setPrice(price[i]);
                    ib.setImg(img[i]);
                    items.add(ib);
                }
            }
            request.setAttribute("items", items);
            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher("/apple.jsp");
            rd.forward(request, response);
        } else if ("samsung".equalsIgnoreCase(action)) {
            String search = request.getParameter("search");
            String checkPrice = request.getParameter("price");
            if (checkPrice == null) {
                checkPrice = "0,9999";
            }
            String[] parts = checkPrice.split(",");
            int min = Integer.parseInt(parts[0]);
            int max = Integer.parseInt(parts[1]);
            ArrayList items = new ArrayList();
            String[] id = {"S001", "S002", "S003", "S004", "S005", "S006", "S007", "S008"};
            String[] name = {"Galaxy S7", "Galaxy S7 edge", "Galaxy S6", "Galaxy S6 edge", "Galaxy Note4", "Galaxy Note5", "Galaxy Note3", "Galaxy Note7"};
            String[] description = {"Galaxy S7 is good", "Galaxy edge is nice", "Galaxy S6 is cheap", "Galaxy edge is good", "Galaxy Note4 is nice", "Galaxy Note5 is good", "Galaxy Note3 is cheap", "Galaxy Note7 is good"};
            int[] available = {3, 2, 4, 7, 9, 7, 6, 5};
            int[] price = {200, 400, 600, 300, 600, 900, 1000, 1100};
            String[] img = {"img/samsung/s7.jpg", "img/samsung/s7e.jpg", "img/samsung/s6.jpg", "img/samsung/s6e.jpg", "img/samsung/n4.jpg", "img/samsung/n5.jpg", "img/samsung/n3.jpg", "img/samsung/n7.jpeg"};
            for (int i = 0; i < name.length; i++) {
                if (name[i].toLowerCase().contains(search.toLowerCase()) && price[i] >= min && price[i] <= max) {
                    ItemBean ib = new ItemBean();
                    ib.setId(id[i]);
                    ib.setName(name[i]);
                    ib.setDescription(description[i]);
                    ib.setAvailable(available[i]);
                    ib.setPrice(price[i]);
                    ib.setImg(img[i]);
                    items.add(ib);
                }
            }
            request.setAttribute("items", items);
            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher("/samsung.jsp");
            rd.forward(request, response);
        } else if ("htc".equalsIgnoreCase(action)) {
            String search = request.getParameter("search");
            String checkPrice = request.getParameter("price");
            if (checkPrice == null) {
                checkPrice = "0,9999";
            }
            String[] parts = checkPrice.split(",");
            int min = Integer.parseInt(parts[0]);
            int max = Integer.parseInt(parts[1]);
            ArrayList items = new ArrayList();
            String[] id = {"H001", "H002", "H003", "H004", "H005", "H006", "H007", "H008"};
            String[] name = {"One A9", "One M9+", "One E9", "One M9", "Butterfly 2", "Desire 10", "Desire 530", "Desire EYE"};
            String[] description = {"one A9 is good", "one M9+ is nice", "one E9 is good", "one M9 is cheap", "Butterfly2 is good", "desire 10 is nice", "desire 530 is cheap", "desire EYE is nice"};
            int[] available = {10, 12, 10, 9, 7, 8, 11, 13};
            int[] price = {100, 200, 400, 300, 350, 400, 600, 650};
            String[] img = {"img/htc/a9.jpg", "img/htc/m9p.jpg", "img/htc/e9.jpg", "img/htc/m9.jpg", "img/htc/b2.jpg", "img/htc/d10.jpg", "img/htc/d530.jpeg", "img/htc/de.png"};
            for (int i = 0; i < name.length; i++) {
                if (name[i].toLowerCase().contains(search.toLowerCase()) && price[i] >= min && price[i] <= max) {
                    ItemBean ib = new ItemBean();
                    ib.setId(id[i]);
                    ib.setName(name[i]);
                    ib.setDescription(description[i]);
                    ib.setAvailable(available[i]);
                    ib.setPrice(price[i]);
                    ib.setImg(img[i]);
                    items.add(ib);
                }
            }
            request.setAttribute("items", items);
            RequestDispatcher rd;
            rd = getServletContext().getRequestDispatcher("/htc.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
