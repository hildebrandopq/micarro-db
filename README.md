🚗 MiCarro – Plataforma de compraventa de vehículos
Sistema de base de datos relacional diseñado para gestionar una plataforma de compraventa de vehículos usados y repuestos, desarrollado como proyecto académico en la Escuela Colombiana de Ingeniería Julio Garavito.

📌 Descripción general
MiCarro conecta compradores y vendedores de vehículos usados y repuestos dentro de una plataforma administrada. El proyecto abarcó todo el ciclo de diseño de una base de datos: desde el modelado conceptual con diagramas UML en Astah, pasando por el modelo lógico y relacional, hasta la implementación física completa en Oracle con automatización, seguridad y optimización.

🗂️ Diagrama conceptual

Vista general de las entidades y sus relaciones principales.

<img width="1371" height="820" alt="image" src="https://github.com/user-attachments/assets/4467c28e-f661-4a20-8711-a5505100585f" />

🧩 Diagrama de clases (con atributos)

Detalle completo de cada entidad con sus atributos y tipos de dato.

<img width="1259" height="806" alt="image" src="https://github.com/user-attachments/assets/1102d3ab-1156-4f06-bfa5-3afcbb39547c" />

🔗 Modelo relacional

Representación de las tablas con sus claves primarias y foráneas.

<img width="630" height="794" alt="image" src="https://github.com/user-attachments/assets/14c4f6ab-bda6-427d-a6d8-b39d9d517d60" />

🏗️ Modelo físico

Implementación real en Oracle con tablas, constraints, triggers e índices.

<img width="1006" height="729" alt="image" src="https://github.com/user-attachments/assets/8dc9e1ae-9c5e-4c9a-89b9-5eaa95b17879" />

👥 Casos de uso y consultas
Consultas Gerenciales

Funcionalidades disponibles para el Gerente

<img width="1186" height="802" alt="image" src="https://github.com/user-attachments/assets/107a9787-d40e-41b6-87dd-2e98d57a1751" />

Consultas Operativas

Funcionalidades operativas del sistema

<img width="1462" height="829" alt="image" src="https://github.com/user-attachments/assets/2d47136a-7f78-420e-a909-d44810050094" />

Funciones del sistema

Funciones principales por actor

<img width="1356" height="817" alt="image" src="https://github.com/user-attachments/assets/91a2c3de-4078-4ae8-bba4-b907b3e8099b" />

📦 Packages PL/SQL
Componentes – CRUD por entidad

Packages implementados para gestionar las operaciones principales del sistema

<img width="1355" height="486" alt="image" src="https://github.com/user-attachments/assets/9f4050cf-9394-4297-8377-27f2eda24fa3" />

Seguridad – Packages por actor

Packages organizados por rol con sus procedimientos y funciones permitidas

<img width="1107" height="766" alt="image" src="https://github.com/user-attachments/assets/39c3cf8c-9f49-4690-b9d2-805650303df9" />

🗃️ Estructura de la base de datos
17 tablas interrelacionadas:
TablaDescripciónusuariosRegistro general de todos los usuarioscompradoresDatos específicos del compradorvendedoresDatos específicos del vendedorempleadosPersonal que administra la plataformavehiculosVehículos publicados en la plataformahistorialPropietariosCambios de dueño de cada vehículoofertasOfertas realizadas sobre vehículos o partestransaccionesRegistro de cada transacción generadacomprasCompras aprobadas o en procesosegurosPólizas asociadas a vehículospartesAutoCatálogo de repuestos disponiblesdevolucionesSolicitudes de devolucióndevolucionVehiculosDevoluciones específicas de vehículosdevolucionRepuestosDevoluciones específicas de repuestosnotificacionesAlertas automáticas del sistemareporteProblemasReportes generados por usuariosplataformaRegistro de la plataforma

⚡ Automatización con Triggers
TriggerFuncióntrg_notificaciones_biGenera idNotificacion automáticamentetrg_notificaciones_fecha_biAsigna fecha actual al insertartrg_notificaciones_estadoCambia estado a enviada automáticamentetrg_partesauto_biGenera idPartes automáticamentetrg_partesauto_check_cantidadValida que cantidad no sea negativatrg_partesauto_set_activaCambia estado a ACTIVA cuando está completatrg_partesauto_agotadoCambia estado a Agotado cuando cantidad = 0trg_transacciones_biGenera idTransaccion automáticamentetrg_compras_biGenera idCompra automáticamentetrg_compras_fecha_biAsigna fecha actual al insertar

📦 Packages PL/SQL
PackageOperacionesPKG_PARTESAUTOCrear, obtener, listar, actualizar, eliminar partesPKG_VEHICULOSAlta, actualizar estado, buscar, eliminar vehículosPKG_EMPLEADOSInsertar, modificar, consultar, eliminar empleadosPKG_SEGUROSAgregar, modificar, consultar, eliminar seguros

👁️ Vistas
VistaDescripciónVHistorialCompletoHistorial completo de cambios de propietarioVUltimoCambioPropietarioÚltimo cambio de propietario por vehículoVVehiculosPorUsuarioCantidad de vehículos por usuarioVVehiculosDisponiblesVehículos en estado disponibleVVehiculosRecientesVehículos publicados en los últimos 30 días

🔐 Seguridad por roles
RolPermisos principalesempleadoCRUD completo sobre usuarios, devoluciones y segurosclienteINSERT y UPDATE en ofertas, reportes y segurosvendedorSELECT en ofertas y reportes, INSERT en segurosasesorCRUD completo sobre seguros

👤 Actores del sistema
Cliente, Comprador, Vendedor, Empleado, Asesor, Gerente y Vendedores, cada uno con casos de uso específicos que van desde realizar compras y gestionar ofertas hasta consultar reportes de ventas y administrar devoluciones.

🛠️ Tecnologías

Oracle Database
PL/SQL
SQL
UML
Astah
