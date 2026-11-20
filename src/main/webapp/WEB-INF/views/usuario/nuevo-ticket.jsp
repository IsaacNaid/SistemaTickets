<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Nuevo ticket</title>
    <!-- Único CSS del proyecto (lo mantiene Isaac) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
</head>
<body>
<main class="content">

    <div class="topbar">
        <h1>Nuevo ticket</h1>
        <a class="btn-secondary" href="${pageContext.request.contextPath}/usuario/inicio">Volver al panel</a>
    </div>

    <%-- Mensajes que manda el Servlet --%>
    <% if (request.getAttribute("mensaje") != null) { %>
    <div class="alert alert-success">${mensaje}</div>
    <% } %>
    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-error">${error}</div>
    <% } %>

    <section class="card">
        <form action="${pageContext.request.contextPath}/usuario/nuevo-ticket" method="post">

            <label for="usuario">Tu nombre o correo</label>
            <input class="form-control" type="text" id="usuario" name="usuario"
                   placeholder="ej. brian@utez.edu.mx" required>

            <label for="titulo">Asunto</label>
            <input class="form-control" type="text" id="titulo" name="titulo"
                   maxlength="80" placeholder="ej. No enciende el proyector" required>

            <label for="descripcion">Descripción del problema</label>
            <textarea class="form-control" id="descripcion" name="descripcion" rows="4"
                      placeholder="Explica qué pasa, desde cuándo y dónde" required></textarea>

            <label for="categoria">Categoría</label>
            <select class="form-control" id="categoria" name="categoria" required>
                <option value="">Selecciona...</option>
                <option value="Hardware">Hardware</option>
                <option value="Software">Software</option>
                <option value="Red">Red</option>
                <option value="Acceso">Acceso</option>
                <option value="Otros">Otros</option>
            </select>

            <label for="prioridad">Prioridad</label>
            <select class="form-control" id="prioridad" name="prioridad" required>
                <option value="Baja">Baja</option>
                <option value="Media" selected>Media</option>
                <option value="Alta">Alta</option>
            </select>

            <button class="btn-primary" type="submit">Registrar ticket</button>
        </form>
    </section>

    <%--el ticket entró a la lista y a la cola --%>
    <p class="info">
        Tickets en la lista general: <strong>${totalLista}</strong> |
        Tickets en la cola de pendientes: <strong>${totalCola}</strong>
    </p>
    <a class="btn-secondary" href="${pageContext.request.contextPath}/usuario/mis-tickets">Ver mis tickets</a>

</main>
</body>
</html>