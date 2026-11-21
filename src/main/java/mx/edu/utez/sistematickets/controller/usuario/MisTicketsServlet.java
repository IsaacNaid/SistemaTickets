package mx.edu.utez.sistematickets.controller.usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.sistematickets.model.Ticket;
import mx.edu.utez.sistematickets.repository.AppData;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/usuario/mis-tickets")
public class MisTicketsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String folioBuscado = request.getParameter("folio");
        List<Ticket> ticketsAMostrar;

        if (folioBuscado != null && !folioBuscado.trim().isEmpty()) {
            ticketsAMostrar = new ArrayList<>();
            Ticket encontrado = AppData.buscarPorFolio(folioBuscado.trim());
            if (encontrado != null) {
                ticketsAMostrar.add(encontrado);
            }
        } else {
            // Obtiene la lista general compartida desde AppData sin crear otra nueva
            ticketsAMostrar = AppData.getListaGeneral();
        }

        request.setAttribute("tickets", ticketsAMostrar);
        request.setAttribute("folioBuscado", folioBuscado != null ? folioBuscado : "");

        request.getRequestDispatcher("/WEB-INF/views/usuario/mis-tickets.jsp").forward(request, response);
    }
}