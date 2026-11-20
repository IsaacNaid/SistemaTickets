<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Nuevo ticket | Sistema de Tickets</title>
    <!-- Único CSS del proyecto-->
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

            <!-- "active" marca la pantalla en la que estamos -->
            <a href="${pageContext.request.contextPath}/usuario/nuevo-ticket" class="sidebar-link active">
                <span class="sidebar-icon">+</span>
                Nuevo ticket
            </a>

            <a href="${pageContext.request.contextPath}/usuario/mis-tickets" class="sidebar-link">
                <span class="sidebar-icon">☰</span>
                Mis tickets
            </a>
        </nav>

        <div class="sidebar-footer">
            <!-- Ruta del login-->
            <a href="${pageContext.request.contextPath}/login" class="sidebar-link">
                <span class="sidebar-icon">↪</span>
                Cerrar sesión
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
                <strong>Usuario</strong>
                <span>Solicitante</span>
            </div>
            <div class="user-avatar">US</div>
        </div>

    </header>


    <!-- CONTENIDO QUE CAMBIA -->
    <main class="main-content">
        <div class="content-container">

            <!-- Encabezado de la pantalla -->
            <div class="page-header-row">
                <div class="page-header">
                    <h2>Nuevo ticket</h2>
                    <p>Describe el problema y lo agregaremos a la cola de atención.</p>
                </div>
                <a href="${pageContext.request.contextPath}/usuario/mis-tickets" class="btn btn-secondary">
                    Ver mis tickets
                </a>
            </div>

            <%-- Mensajes que manda el Servlet --%>
            <% if (request.getAttribute("mensaje") != null) { %>
            <div class="alert alert-success">${mensaje}</div>
            <% } %>
            <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-error">${error}</div>
            <% } %>

            <%--el ticket entró a la lista y a la cola --%>
            <div class="cards-grid">
                <div class="stat-card">
                    <div class="stat-info">
                        <span>Tickets en la lista general</span>
                        <strong>${totalLista}</strong>
                    </div>
                    <div class="stat-icon">☰</div>
                </div>

                <div class="stat-card">
                    <div class="stat-info">
                        <span>Tickets en la cola de pendientes</span>
                        <strong>${totalCola}</strong>
                    </div>
                    <div class="stat-icon">⏳</div>
                </div>
            </div>

            <!-- Formulario -->
            <section class="card">

                <div class="card-header">
                    <div>
                        <h3>Datos del problema</h3>
                        <p>Todos los campos son obligatorios.</p>
                    </div>
                </div>

                <form action="${pageContext.request.contextPath}/usuario/nuevo-ticket" method="post"
                      class="form-stack">

                    <div class="form-row">
                        <div class="form-group">
                            <label for="usuario">Tu nombre o correo</label>
                            <input type="text" id="usuario" name="usuario"
                                   placeholder="ej. brian@utez.edu.mx" required>
                        </div>

                        <div class="form-group">
                            <label for="titulo">Asunto</label>
                            <input type="text" id="titulo" name="titulo" maxlength="80"
                                   placeholder="ej. No enciende el proyector" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label for="categoria">Categoría</label>
                            <select id="categoria" name="categoria" required>
                                <option value="">Selecciona...</option>
                                <option value="Hardware">Hardware</option>
                                <option value="Software">Software</option>
                                <option value="Red">Red</option>
                                <option value="Acceso">Acceso</option>
                                <option value="Otros">Otros</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="prioridad">Prioridad</label>
                            <select id="prioridad" name="prioridad" required>
                                <option value="Baja">Baja</option>
                                <option value="Media" selected>Media</option>
                                <option value="Alta">Alta</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="descripcion">Descripción del problema</label>
                        <textarea id="descripcion" name="descripcion"
                                  placeholder="Explica qué pasa, desde cuándo y dónde" required></textarea>
                    </div>

                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary">Limpiar</button>
                        <button type="submit" class="btn btn-primary">Registrar ticket</button>
                    </div>

                </form>
            </section>

        </div>
    </main>

</div>

</body>
</html>