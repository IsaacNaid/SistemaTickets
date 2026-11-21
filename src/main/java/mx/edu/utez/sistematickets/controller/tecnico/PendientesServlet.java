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
import java.util.List;


@WebServlet("/tecnico/pendientes")
public class PendientesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ColaTickets cola = AppData.getColaPendientes();

        List<Ticket> pendientes = cola.recorrer();

        request.setAttribute("pendientes", pendientes);
        request.setAttribute("totalPendientes", cola.tamanio());
        request.setAttribute("siguiente", cola.consultarPrimero());

        HttpSession session = request.getSession(false);
        if (session != null) {
            moverASolicitud(session, request, "mensajeExito");
            moverASolicitud(session, request, "mensajeError");
            moverASolicitud(session, request, "ticketAtendido");
        }

        request.getRequestDispatcher("/WEB-INF/views/tecnico/pendientes.jsp")
                .forward(request, response);
    }

    private void moverASolicitud(HttpSession session, HttpServletRequest request, String nombre) {
        Object valor = session.getAttribute(nombre);
        if (valor != null) {
            request.setAttribute(nombre, valor);
            session.removeAttribute(nombre);
        }
    }
}
