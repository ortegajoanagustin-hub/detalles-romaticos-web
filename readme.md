# AMOR & DETALLE — avance 16/10

## Cuentas de prueba
| Rol | Email | Contraseña |
|---|---|---|
| Administrador | admin@amordetalle.com | Admin1234 |
| Cliente | cliente@amordetalle.com | Cliente1234 |

## Estructura
```
config/conexion.php        conexión PDO
database/*.sql             esquema + datos de prueba (basado en der.sql / si.vuerd)
includes/                  funciones (sesión, CSRF, roles), header, navbar, footer
auth/                      login, registro, procesar_*, log_out
admin/                     dashboard, pedidos, agregar_producto, guardar_producto
index.php  producto.php  carrito.php  mis_pedidos.php  mis_direcciones.php
css/ js/ uploads/productos/
prototipo_html/            maquetas HTML originales (solo referencia)
documentacion/             carpeta del sistema (docx)
```

## Requisitos de PHP
PDO MySQL y `fileinfo` (ambos vienen activados en XAMPP).
