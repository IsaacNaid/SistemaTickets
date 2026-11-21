<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Inicio Técnico | Sistema de Tickets</title>

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
            <a href="${pageContext.request.contextPath}/tecnico/inicio"
               class="sidebar-link active">

                <span class="sidebar-icon">⌂</span>
                Inicio

            </a>

            <!-- Tickets pendientes -->
            <a href="${pageContext.request.contextPath}/tecnico/pendientes"
               class="sidebar-link">

                <span class="sidebar-icon">≡</span>
                Tickets pendientes

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

                <strong>Técnico</strong>
                <span>Soporte</span>

            </div>

            <div class="user-avatar">
                TE
            </div>

        </div>

    </header>
    <main class="main-content">

        <div class="content-container">


            <!-- Encabezado -->
            <div class="page-header">

                <h2>Bienvenido</h2>

                <p>
                    Consulta y atiende las solicitudes de soporte técnico.
                </p>

            </div>
            <div class="cards-grid">


                <!-- Pendientes -->
                <div class="stat-card">

                    <div class="stat-info">

                        <span>Tickets pendientes</span>
                        <strong>0</strong>

                    </div>

                    <div class="stat-icon">
                        ≡
                    </div>

                </div>
                <div class="stat-card">

                    <div class="stat-info">

                        <span>En proceso</span>
                        <strong>0</strong>

                    </div>

                    <div class="stat-icon">
                        ◷
                    </div>

                </div>
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
            <div class="card">

                <div class="card-header">

                    <div>

                        <h3>Próximo ticket por atender</h3>

                        <p>
                            Los tickets se atienden en el orden
                            en que fueron registrados.
                        </p>

                    </div>

                </div>
                <div class="empty-state">

                    <h3>No hay tickets pendientes</h3>

                    <p>
                        Cuando un usuario registre un ticket,
                        aparecerá aquí para ser atendido.
                    </p>

                    <a href="${pageContext.request.contextPath}/tecnico/pendientes"
                       class="btn btn-primary">

                        Ver tickets pendientes

                    </a>

                </div>

            </div>

        </div>

    </main>

</div>

</body>

</html>