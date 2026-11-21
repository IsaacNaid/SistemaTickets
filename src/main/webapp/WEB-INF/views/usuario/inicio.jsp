```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Inicio | Sistema de Tickets</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/styles.css">
</head>

<body>

<div class="app-layout">
    <aside class="sidebar">

        <div class="sidebar-header">

            <div class="sidebar-brand">

                <div class="sidebar-logo">
                    ST
                </div>

                <div class="sidebar-brand-text">
                    <h2>Sistema de Tickets</h2>
                    <span>Soporte Técnico</span>
                </div>

            </div>

        </div>


        <nav class="sidebar-menu">

            <p class="sidebar-title">Menú</p>

            <!-- Inicio -->
            <a href="${pageContext.request.contextPath}/usuario/inicio"
               class="sidebar-link active">

                <span class="sidebar-icon">⌂</span>
                Inicio

            </a>

            <!-- Nuevo ticket -->
            <a href="${pageContext.request.contextPath}/usuario/nuevo-ticket"
               class="sidebar-link">

                <span class="sidebar-icon">+</span>
                Nuevo ticket

            </a>

            <!-- Mis tickets -->
            <a href="${pageContext.request.contextPath}/usuario/mis-tickets"
               class="sidebar-link">

                <span class="sidebar-icon">≡</span>
                Mis tickets

            </a>

        </nav>


        <div class="sidebar-footer">

            <a href="${pageContext.request.contextPath}/"
               class="sidebar-link">

                <span class="sidebar-icon">↪</span>
                Cerrar sesión

            </a>

        </div>

    </aside>
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

            <div class="user-avatar">
                US
            </div>

        </div>

    </header>
    <main class="main-content">

        <div class="content-container">


            <!-- Encabezado -->
            <div class="page-header">

                <h2>Bienvenido</h2>

                <p>
                    Consulta y administra tus solicitudes de soporte técnico.
                </p>

            </div>
            <div class="cards-grid">


                <!-- Mis tickets -->
                <div class="stat-card">

                    <div class="stat-info">

                        <span>Mis tickets</span>
                        <strong>0</strong>

                    </div>

                    <div class="stat-icon">
                        ≡
                    </div>

                </div>


                <!-- Pendientes -->
                <div class="stat-card">

                    <div class="stat-info">

                        <span>Pendientes</span>
                        <strong>0</strong>

                    </div>

                    <div class="stat-icon">
                        ◷
                    </div>

                </div>


                <!-- Resueltos -->
                <div class="stat-card">

                    <div class="stat-info">

                        <span>Resueltos</span>
                        <strong>0</strong>

                    </div>

                    <div class="stat-icon">
                        ✓
                    </div>

                </div>

            </div>


            <!-- =========================
                 ACCIONES RÁPIDAS
                 ========================= -->
            <div class="card">

                <div class="card-header">

                    <div>

                        <h3>Acciones rápidas</h3>
                        <p>¿Qué deseas hacer?</p>

                    </div>

                </div>


                <div class="form-actions"
                     style="justify-content: flex-start; margin-top: 0;">

                    <a href="${pageContext.request.contextPath}/usuario/nuevo-ticket"
                       class="btn btn-primary">

                        + Nuevo ticket

                    </a>

                    <a href="${pageContext.request.contextPath}/usuario/mis-tickets"
                       class="btn btn-secondary">

                        Ver mis tickets

                    </a>

                </div>

            </div>

        </div>

    </main>

</div>

</body>

</html>