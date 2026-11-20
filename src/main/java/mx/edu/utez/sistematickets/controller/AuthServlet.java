package mx.edu.utez.sistematickets.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AuthServlet", value = "/login")
public class AuthServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String rol = request.getParameter("rol");

        if ("usuario".equals(rol)) {
            response.sendRedirect(
                    request.getContextPath() + "/usuario/inicio"
            );

        } else if ("tecnico".equals(rol)) {
            response.sendRedirect(
                    request.getContextPath() + "/tecnico/inicio"
            );
        }
    }
}