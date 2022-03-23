package controller;

import Service.ICustomerService;
import Service.impl.CustomerServiceImpl;
import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customers")
public class CustomerServlet extends HttpServlet {
ICustomerService iCustomerService = new CustomerServiceImpl();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
               showNewForm(request, response);
                break;
            case "edit":
                    showEditForm(request, response);
                break;

            default:
                listCustomer(request, response);
                break;
        }
    }





    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Customer customer = iCustomerService.selectCustomerById(id);
        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void listCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            List<Customer> listCustomer = iCustomerService.selectAllCustomer();
            request.setAttribute("customerlist", listCustomer);
            RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
            dispatcher.forward(request, response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try { switch (action) {
            case "create":

                    insertCustomer(request, response);

                break;
            case "edit":
                    updateCustomer(request, response);
                break;
            case "search":
                searchCustomer(request,response);
                break;
            case "delete":
                try {
                    deleteCustomer(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("searchName");
        List<Customer> customers = iCustomerService.searchCustomer(name);
        request.setAttribute("searchName",customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
        dispatcher.forward(request,response);
    }


    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        Integer gender = Integer.valueOf(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Integer idTypeCustomer = Integer.valueOf(request.getParameter("TypeCustomer"));

        Customer customer = new Customer(id,name,birthday,gender,idCard,phone,email,address,idTypeCustomer);
        iCustomerService.updateCustomer(customer);

        request.setAttribute("customer", customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
         String name = request.getParameter("name");
         String birthday= request.getParameter("birthday");
         Integer gender= Integer.valueOf(request.getParameter("gender"));
         String idCard= request.getParameter("idCard");
         String phone= request.getParameter("phone");
         String email= request.getParameter("email") ;
         String address = request.getParameter("address");
        Integer idTypeCustomer= Integer.valueOf(request.getParameter("TypeCustomer"));
        Customer customer = new Customer(name,birthday,gender,idCard,phone,email,address,idTypeCustomer);
        iCustomerService.insertCustomer(customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("create.jsp");
        dispatcher.forward(request, response);
    }
    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        Integer id = Integer.valueOf(request.getParameter("idDelete"));
        iCustomerService.deleteUser(id);

        List<Customer> listUser = iCustomerService.selectAllCustomer();
        request.setAttribute("customerlist", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        dispatcher.forward(request, response);
    }

}
