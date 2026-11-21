package mx.edu.utez.sistematickets.controller.usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.sistematickets.model.Ticket;
import mx.edu.utez.sistematickets.repository.AppData;

import java.io.IOException;

@WebServlet(name = "nuevoTicketServlet", value = "/usuario/nuevo-ticket")
public class NuevoTicketServlet extends HttpServlet {
    //sera un controlador del registro de tickets, usando GET para mostrar el formulario y POST para crear el
    //ticket, lo agrega a la lista y lo encola

    private static final String VISTA = "/WEB-INF/views/usuario/nuevo-ticket.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{

        //si venimos de un registro exitoso, el folio llega en la URl ,ejemplo (?registrado=T-001)
        String registrado = request.getParameter("registrado");
        if (registrado != null && AppData.buscarPorFolio(registrado) != null){
            request.setAttribute("mensaje", "Ticket " + registrado + " registrado exitosamente");
        }
        //para poder comprobar que el ticket si entro a ambas estructuras
        request.setAttribute("totalLista", AppData.getListaGeneral().size());
        request.setAttribute("totalCola", AppData.getColaPendientes().tamanio());
        //La JSP esta dentro de WEB-INF, asi que solo se llega a ella con forward
        request.getRequestDispatcher(VISTA).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        //Sin esto los acentos y la ñ llegan dañados
        request.setCharacterEncoding("UTF-8");

        //leemos los datos del formulario
        String titulo = limpiar(request.getParameter("titulo"));
        String descripcion = limpiar(request.getParameter("descripcion"));
        String categoria = limpiar(request.getParameter("categoria"));
        String prioridad = limpiar(request.getParameter("prioridad"));
        String usuario = limpiar(request.getParameter("usuario"));

        //validamos que no falte nada de nada
        if (titulo.isEmpty() || descripcion.isEmpty() || categoria.isEmpty() || prioridad.isEmpty() || usuario.isEmpty()) {
            request.setAttribute("error", "Todos los campos son obligatorios");
            request.setAttribute("totalLista", AppData.getListaGeneral().size());
            request.setAttribute("totalCola", AppData.getColaPendientes().tamanio());
            request.getRequestDispatcher(VISTA).forward(request, response);
            return; //detenemos el metodo aqui
        }

        //creamos el objeto con el folio consecutivo y con estado inicial de PENDIENTE
        String folio = AppData.generarFolio();
        Ticket ticket = new Ticket(folio, titulo, descripcion, categoria, prioridad, Ticket.PENDIENTE, usuario);

        //Guardamos el mismo objeto en las 2 estructuras
        //usamos synchronized para evitar que dos peticiones simultaneas desordenen la lista y cola
        synchronized (AppData.class){
            AppData.getListaGeneral().add(ticket);
            AppData.getColaPendientes().encolar(ticket);
        }
        //redirigir evita que al recargar
        //se registre el mismo ticket dos veces
        response.sendRedirect(request.getContextPath() + "/usuario/mis-tickets");
    }

    //Evitamos NullPointerExxception si un parametro no llega y quita espacios sobrantes
    private String limpiar(String valor){
        return valor == null ? "" : valor.trim();
    }
}
