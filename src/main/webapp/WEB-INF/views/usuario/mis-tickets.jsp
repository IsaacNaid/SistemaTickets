<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.sistematickets.model.Ticket" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Tickets | Sistema de Tickets</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
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

            <a href="${pageContext.request.contextPath}/usuario/inicio" class="sidebar-link">
                <span class="sidebar-icon">⌂</span>
                Inicio
            </a>

            <a href="${pageContext.request.contextPath}/usuario/nuevo-ticket" class="sidebar-link">
                <span class="sidebar-icon">+</span>
                Nuevo ticket
            </a>

            <a href="${pageContext.request.contextPath}/usuario/mis-tickets" class="sidebar-link active">
                <span class="sidebar-icon">≡</span>
                Mis tickets
            </a>

        </nav>

        <div class="sidebar-footer">

            <a href="${pageContext.request.contextPath}/" class="sidebar-link">
                <span class="sidebar-icon">↪</span>
                Cerrar sesión
            </a>

        </div>

    </aside>

    <!-- TOPBAR -->
    <header class="topbar">

        <div class="topbar-left">
            <h1>Mis Tickets</h1>
            <p>Consulta de reportes registrados y su estado actual</p>
        </div>

        <div class="topbar-user">

            <div class="user-info">
                <strong>Usuario</strong>
                <span>Solicitante</span>
            </div>

            <div class="user-avatar">
                US
            </div>

        </div>

    </header>

    <!-- CONTENIDO QUE CAMBIA -->
    <main class="main-content">

        <div class="content-container">

            <!-- Encabezado de sección con botón directo a nuevo ticket -->
            <div class="page-header-row">
                <div class="page-header">
                    <h2>Historial de Tickets</h2>
                    <p>Revisa el seguimiento y estado de tus solicitudes</p>
                </div>
                <a href="${pageContext.request.contextPath}/usuario/nuevo-ticket" class="btn btn-primary">
                    + Nuevo Ticket
                </a>
            </div>

            <section class="card">

                <!-- Buscador adaptado a .form-row y .form-group del CSS oficial -->
                <form action="${pageContext.request.contextPath}/usuario/mis-tickets" method="get" class="form-stack">
                    <div class="form-row">
                        <div class="form-group">
                            <input type="text"
                                   name="folio"
                                   placeholder="Buscar por folio (ej. T-001)..."
                                   value="${folioBuscado}">
                        </div>
                        <div class="form-actions" style="justify-content: flex-start; margin-top: 0;">
                            <button type="submit" class="btn btn-primary">Buscar</button>
                            <a href="${pageContext.request.contextPath}/usuario/mis-tickets" class="btn btn-secondary">Ver todos</a>
                        </div>
                    </div>
                </form>

                <%
                    List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");
                    if (tickets == null || tickets.isEmpty()) {
                %>
                    <!-- Estado vacío del CSS oficial (.empty-state) -->
                    <div class="empty-state">
                        <h3>No hay tickets registrados</h3>
                        <p>Aún no se encontraron reportes con los criterios seleccionados.</p>
                        <a href="${pageContext.request.contextPath}/usuario/nuevo-ticket" class="btn btn-primary">
                            Registrar primer ticket
                        </a>
                    </div>
                <%
                    } else {
                %>
                    <!-- Tabla del CSS oficial (.table-container y .table) -->
                    <div class="table-container" style="margin-top: 20px;">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Folio</th>
                                    <th>Título</th>
                                    <th>Categoría</th>
                                    <th>Prioridad</th>
                                    <th>Estado</th>
                                    <th>Usuario</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Ticket t : tickets) {
                                    String estado = t.getEstado() != null ? t.getEstado() : "PENDIENTE";
                                    String badgeClass = "badge-pending";
                                    if ("EN_PROCESO".equalsIgnoreCase(estado) || "EN PROCESO".equalsIgnoreCase(estado)) {
                                        badgeClass = "badge-progress";
                                    } else if ("RESUELTO".equalsIgnoreCase(estado)) {
                                        badgeClass = "badge-resolved";
                                    }
                                %>
                                    <tr>
                                        <td><strong><%= t.getFolio() %></strong></td>
                                        <td><%= t.getTitulo() %></td>
                                        <td><%= t.getCategoria() %></td>
                                        <td><%= t.getPrioridad() %></td>
                                        <td><span class="badge <%= badgeClass %>"><%= estado %></span></td>
                                        <td><%= t.getUsuario() %></td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                <%
                    }
                %>
            </section>

        </div>

    </main>

</div>

</body>
</html>