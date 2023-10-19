# jplay_flutter

Cualquier pregunta o retroalimentacion, no dudes en contactarme:

- LinkedIn: [Perfil linkedin](https://www.linkedin.com/in/samuelaperezjimenez/)
- Email: [perezjsamuel@gmail.com](mailto:perezjsamuel@gmail.com)

## Ambiente

Para ejecutar este proyecto, necesitarás lo siguiente:

- Flutter 3.13.6
- Dart 3.1.3
- Un emulador o dispositivo físico para ejecutar la aplicación

# Documentación de la Aplicación

## Índice

1. [Autenticación](#autenticación)
2. [Ciudad](#ciudad)
3. [Deporte](#deporte)
4. [Juegos](#juegos)
5. [Navegación](#navegación)

---

## **Autenticación**

### Visión General

La aplicación provee un sistema de autenticación de usuarios. Inicialmente, se solicita a los usuarios que inicien sesión.

### Características

- **Inicio de Sesión de Usuario**: Los usuarios deben iniciar sesión utilizando credenciales predefinidas (hardcoded).
  - Si un usuario ya está autenticado, el botón "Iniciar Sesión" se reemplaza por "Cerrar Sesión".
  - El estado de inicio de sesión del usuario se almacena en las preferencias para mantener el estado de la sesión.

---

## **Ciudad**

### Visión General

El módulo Ciudad muestra una lista de ciudades para que los usuarios seleccionen. La ciudad seleccionada se guarda en las preferencias del usuario.

### Características

- **Selección de Ciudad**: Los usuarios pueden ver y seleccionar su ciudad preferida de una lista.

---

## **Deporte**

### Visión General

El módulo Deporte muestra una lista de deportes. Los usuarios pueden seleccionar su deporte preferido, que luego se almacena en las preferencias.

### Características

- **Selección de Deporte**: Permite a los usuarios ver y seleccionar un deporte de una lista.

---

## **Juegos**

### Visión General

Muestra una lista de juegos basada en la ciudad y deporte seleccionados.

---

## **Navegación**

### Visión General

Se utiliza para cambiar entre la pantalla PickUp y Configuración.

### Características

- **Navegación entre Pantallas**: No es necesario guardar en local, con el estado es suficiente.

---

**Nota**: La aplicación utiliza la arquitectura BLoC para gestionar el estado y la lógica de negocio.
