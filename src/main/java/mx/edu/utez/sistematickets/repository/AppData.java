package mx.edu.utez.sistematickets.repository;

import mx.edu.utez.sistematickets.model.Ticket;
import mx.edu.utez.sistematickets.structure.ColaTickets;

import java.util.ArrayList;
import java.util.List;

public class AppData {
    private static final List<Ticket> listaGeneral = new ArrayList<>();

    private static final ColaTickets colaPendientes = new ColaTickets();

    private static int contadorFolios = 0;

    private AppData() {
    }

    public static List<Ticket> getListaGeneral() {
        return listaGeneral;
    }

    public static ColaTickets getColaPendientes() {
        return colaPendientes;
    }

    public static synchronized String generarFolio() {
        contadorFolios++;
        return String.format("T-%03d", contadorFolios);
    }

    public static Ticket buscarPorFolio(String folio){
        for (Ticket t : listaGeneral) {
            if (t.getFolio().equalsIgnoreCase(folio)){
                return t;
            }
        }
        return null;
    }
}
