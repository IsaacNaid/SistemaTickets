<%--
  Created by IntelliJ IDEA.
  User: memol
  Date: 19/11/2026
  Time: 10:46 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.sistematickets.model.Ticket" %>
<%!
    private static String h(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
                .replace("\"", "&quot;").replace("'", "&#39;");
    }

    private static String badgePrioridad(String p) {
        if (p == null) return "badge-progress";
        switch (p.toLowerCase()) {
            case "alta":  return "badge-danger";
            case "media": return "badge-pending";
            default:      return "badge-progress";
        }
    }
%>
<%
    String ctx = request.getContextPath();
    List<Ticket> pendientes = (List<Ticket>) request.getAttribute("pendientes");
    Integer total = (Integer) request.getAttribute("totalPendientes");
    Ticket siguiente = (Ticket) request.getAttribute("siguiente");
    Ticket atendido = (Ticket) request.getAttribute("ticketAtendido");
    String mensajeExito = (String) request.getAttribute("mensajeExito");
    String mensajeError = (String) request.getAttribute("mensajeError");
    if (total == null) total = 0;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tickets pendientes | Sistema de Tickets</title>
    <link rel="stylesheet" href="<%= ctx %>/assets/css/styles.css">
</head>
<body>

<div class="app-layout">

    <!-- SIDEBAR -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="sidebar-brand">
                <div class="sidebar-logo">ST</div>
                <div class="sidebar-brand-text">
                    <h2>Sistema de Tickets</h2>
                    <span>Soporte Técnico</span>
                </div>
            </div>
        </div>

        <nav class="sidebar-menu">
            <p class="sidebar-title">Menú</p>
            <a href="<%= ctx %>/tecnico/inicio" class="sidebar-link">
                <span class="sidebar-icon">⌂</span> Inicio
            </a>
            <a href="<%= ctx %>/tecnico/pendientes" class="sidebar-link active">
                <span class="sidebar-icon">☰</span> Tickets pendientes
            </a>
        </nav>

        <div class="sidebar-footer">
            <a href="<%= ctx %>/" class="sidebar-link">
                <span class="sidebar-icon">↪</span> Cerrar sesión
            </a>
        </div>
    </aside>

    <!-- TOPBAR -->
    <header class="topbar">
        <div class="topbar-left">
            <h1>Sistema de Tickets</h1>
            <p>Gestión de soporte técnico</p>
        </div>
        <div class="topbar-user">
            <div class="user-info">
                <strong>Técnico</strong>
                <span>Soporte técnico</span>
            </div>
            <div class="user-avatar">TC</div>
        </div>
    </header>

    <!-- CONTENIDO -->
    <main class="main-content">
        <div class="content-container">

            <div class="page-header-row">
                <div class="page-header">
                    <h2>Tickets pendientes</h2>

                </div>

                <form action="<%= ctx %>/tecnico/atender" method="post">
                    <button type="submit" class="btn btn-primary" <%= total == 0 ? "disabled style=\"opacity:.5;cursor:not-allowed\"" : "" %>>
                        Atender siguiente
                    </button>
                </form>
            </div>

            <% if (mensajeExito != null) { %>
                <div class="alert alert-success"><%= h(mensajeExito) %></div>
            <% } %>
            <% if (mensajeError != null) { %>
                <div class="alert alert-error"><%= h(mensajeError) %></div>
            <% } %>

            <!-- ESTADÍSTICAS DE LA COLA -->
            <div class="cards-grid">
                <div class="stat-card">
                    <div class="stat-info">
                        <span>Tickets en cola</span>
                        <strong><%= total %></strong>
                    </div>
                    <div class="stat-icon">☰</div>
                </div>

                <div class="stat-card">
                    <div class="stat-info">
                        <span>Siguiente en atenderse</span>
                        <strong><%= siguiente != null ? h(siguiente.getFolio()) : "—" %></strong>
                    </div>
                    <div class="stat-icon">→</div>
                </div>

                <div class="stat-card">
                    <div class="stat-info">
                        <span>Recién atendido</span>
                        <strong><%= atendido != null ? h(atendido.getFolio()) : "—" %></strong>
                    </div>
                    <div class="stat-icon">✓</div>
                </div>
            </div>

            <!-- DATOS DEL TICKET ATENDIDO -->
            <% if (atendido != null) { %>
            <div class="card" style="margin-bottom: 25px;">
                <div class="card-header">
                    <div>
                        <h3>Ticket atendido: <%= h(atendido.getFolio()) %></h3>
                    </div>
                    <span class="badge badge-progress"><%= h(atendido.getEstado()) %></span>
                </div>

                <div class="table-container">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>Título</th>
                            <th>Categoría</th>
                            <th>Prioridad</th>
                            <th>Usuario</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><%= h(atendido.getTitulo()) %></td>
                            <td><%= h(atendido.getCategoria()) %></td>
                            <td><span class="badge <%= badgePrioridad(atendido.getPrioridad()) %>"><%= h(atendido.getPrioridad()) %></span></td>
                            <td><%= h(atendido.getUsuario()) %></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <% } %>

            <!-- COLA DE PENDIENTES -->
            <div class="card">
                <div class="card-header">
                    <div>
                        <h3>Cola de pendientes</h3>
                        <p>De frente a final. La prioridad es informativa y no cambia el orden.</p>
                    </div>
                </div>

                <% if (pendientes == null || pendientes.isEmpty()) { %>
                    <div class="empty-state">
                        <h3>No hay tickets pendientes</h3>
                        <p>Cuando un usuario registre un ticket aparecerá aquí.</p>
                    </div>
                <% } else { %>
                    <div class="table-container">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Posición</th>
                                <th>Folio</th>
                                <th>Título</th>
                                <th>Categoría</th>
                                <th>Prioridad</th>
                                <th>Usuario</th>
                                <th>Estado</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% int pos = 1; for (Ticket t : pendientes) { %>
                            <tr>
                                <td><%= pos == 1 ? "1 (frente)" : String.valueOf(pos) %></td>
                                <td><strong><%= h(t.getFolio()) %></strong></td>
                                <td><%= h(t.getTitulo()) %></td>
                                <td><%= h(t.getCategoria()) %></td>
                                <td><span class="badge <%= badgePrioridad(t.getPrioridad()) %>"><%= h(t.getPrioridad()) %></span></td>
                                <td><%= h(t.getUsuario()) %></td>
                                <td><span class="badge badge-pending"><%= h(t.getEstado()) %></span></td>
                            </tr>
                            <% pos++; } %>
                            </tbody>
                        </table>
                    </div>
                <% } %>
            </div>

        </div>
    </main>

</div>

</body>
</html>
