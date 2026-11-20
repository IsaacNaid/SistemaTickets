package mx.edu.utez.sistematickets.structure;

import mx.edu.utez.sistematickets.model.Ticket;

import java.util.ArrayList;
import java.util.List;

/** TAD ColaTickets (FIFO) con nodos enlazados. */
public class ColaTickets {

    private NodoTicket frente;
    private NodoTicket fin;   // "final" es palabra reservada en Java
    private int tamanio;

    public ColaTickets() {
        this.frente = null;
        this.fin = null;
        this.tamanio = 0;
    }

    public synchronized void encolar(Ticket ticket) {
        if (ticket == null) {
            throw new IllegalArgumentException("El ticket no puede ser null");
        }
        NodoTicket nuevo = new NodoTicket(ticket);
        if (estaVacia()) {
            frente = nuevo;
        } else {
            fin.setSiguiente(nuevo);
        }
        fin = nuevo;
        tamanio++;
    }

    /** Retira y devuelve el ticket del frente; null si la cola está vacía. */
    public synchronized Ticket desencolar() {
        if (estaVacia()) {
            return null;
        }
        Ticket atendido = frente.getTicket();
        frente = frente.getSiguiente();
        if (frente == null) {
            fin = null;
        }
        tamanio--;
        return atendido;
    }

    public synchronized Ticket consultarPrimero() {
        return estaVacia() ? null : frente.getTicket();
    }

    public synchronized boolean estaVacia() {
        return frente == null;
    }

    public synchronized int tamanio() {
        return tamanio;
    }

    /** Recorre de frente a final y devuelve una copia (no modifica la cola). */
    public synchronized List<Ticket> recorrer() {
        List<Ticket> tickets = new ArrayList<>();
        NodoTicket actual = frente;
        while (actual != null) {
            tickets.add(actual.getTicket());
            actual = actual.getSiguiente();
        }
        return tickets;
    }
}
