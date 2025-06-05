#  Sistema de Gestión para Peluquería JG

Este proyecto consiste en un Sistema para la peluquería *JG*, diseñado para facilitar la administración de servicios, clientes, turnos, productos y facturación. Está pensado para ayudar al personal a optimizar su tiempo, organizar el trabajo diario y ofrecer una mejor atención al cliente.

##  Descripción General

El sistema permite llevar un control eficiente de los distintos aspectos de la peluquería, incluyendo:

- Registro y gestión de *clientes*.
- Gestión de *servicios ofrecidos* (corte, coloración, peinados, tratamientos, etc.).
- Control de *productos de uso y venta* (stock, precios, descripciones).
- Generación de *facturas de venta*.
- Registro de *ingresos y gastos*.
- Reportes simples para el seguimiento del negocio.

##  Integrantes del grupo

- Aracely Arrua 
- Marcos Martinez 
- Dieter Pastoriza 

##  Instalación o prueba del Proyecto

- En caso que salga el siguiente error: deployment descriptor directory cannot be found. It may have been remove or renamed.
- Significa que no fue descargado con exito la carpeta WEB-INF, la cual es necesaria para poder ejecutar el sistema en apache netbeans, por lo que seria necesario crear una carpeta con ese nombre dentro de la carpeta Web Pages.
- Tambien para poder ejecutar el programa correctamente, debe de estar configurado nuestro xampp.
- Tanto apache como mysql deben estar encendidos.
- Tomcat seria lo que se debe de configurar. Debemos entrar en el apartado config, luego tomacat-users.xml, y dentro de ese bloc de notas debemos escribir lo siguiente:

 ** <?xml version="1.0" encoding="UTF-8"?> **
 <tomcat-users>
    <role rolename="manager-gui"/>
    <user password="1234" roles="manager-gui, manager-script,admin" username="admin"/>
 </tomcat-users>
        
- Guardamos esa configuración y ahora debemos de configurar en netbeans. Debemos ingresar en el apartado de services, luego en servers, add server, seleccionamos apache Tomcat or Tomee, y debemos seleccionar la siguiente ubicación: C:\xampp\tomcat , luego debemos de poner el usuario y contraseña que configuramos en el xampp.
