<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Iniciar sesión | Sistema de Tickets</title>

  <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/styles.css">
</head>

<body class="login-body">

<div class="login-container">

  <!-- Lado izquierdo -->
  <section class="login-info">

    <div class="login-brand">
      <div class="brand-logo">ST</div>

      <div>
        <h1>Sistema de Tickets</h1>
        <span>Soporte Técnico</span>
      </div>
    </div>

    <div class="login-description">

      <h2>Soporte técnico más simple y organizado</h2>

      <p>
        Registra tus problemas, consulta el estado de tus
        solicitudes y recibe seguimiento del personal técnico.
      </p>

      <div class="feature">
        <span>✓</span>
        <p>Registra solicitudes de soporte.</p>
      </div>

      <div class="feature">
        <span>✓</span>
        <p>Consulta el estado de tus tickets.</p>
      </div>

      <div class="feature">
        <span>✓</span>
        <p>Recibe seguimiento del personal técnico.</p>
      </div>

    </div>

    <p class="login-footer">
      Sistema Web de Tickets de Soporte Técnico
    </p>

  </section>


  <!-- Lado derecho -->
  <section class="login-form-section">

    <div class="login-form-container">

      <div class="login-header">
        <h2>Bienvenido</h2>
        <p>Inicia sesión para continuar</p>
      </div>


      <form class="login-form"
            action="${pageContext.request.contextPath}/login"
            method="post">

        <!-- Correo -->
        <div class="form-group">
          <label for="correo">Correo electrónico</label>

          <input
                  type="email"
                  id="correo"
                  name="correo"
                  placeholder="correo@ejemplo.com"
                  required>
        </div>


        <!-- Contraseña -->
        <div class="form-group">
          <label for="password">Contraseña</label>

          <input
                  type="password"
                  id="password"
                  name="password"
                  placeholder="Ingresa tu contraseña"
                  required>
        </div>


        <!-- Rol -->
        <div class="form-group">
          <label for="rol">Tipo de usuario</label>

          <select id="rol" name="rol" required>
            <option value="usuario">Usuario</option>
            <option value="tecnico">Técnico de soporte</option>
          </select>
        </div>


        <!-- Botón -->
        <button type="submit" class="btn btn-primary">
          Iniciar sesión
        </button>

      </form>

    </div>

  </section>

</div>

</body>
</html>