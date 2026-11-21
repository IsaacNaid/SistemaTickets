package mx.edu.utez.sistematickets.controller.tecnico;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.sistematickets.model.Ticket;
import mx.edu.utez.sistematickets.repository.AppData;
import mx.edu.utez.sistematickets.structure.ColaTickets;

import java.io.IOException;


@WebServlet("/tecnico/atender")
public class AtenderTicketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ColaTickets cola = AppData.getColaPendientes();
        HttpSession session = request.getSession();

        Ticket ticket = cola.desencolar();

        if (ticket == null) {
            session.setAttribute("mensajeError", "No hay tickets pendientes");
        } else {
            ticket.setEstado("EN_PROCESO");
            session.setAttribute("ticketAtendido", ticket);
            session.setAttribute("mensajeExito",
                    "Se atendio el ticket " + ticket.getFolio() + ". Ahora esta EN_PROCESO.");
        }

        response.sendRedirect(request.getContextPath() + "/tecnico/pendientes");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect(request.getContextPath() + "/tecnico/pendientes");
    }
}
