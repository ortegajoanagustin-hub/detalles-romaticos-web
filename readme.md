# AMOR & DETALLE — avance 16/10

Tienda de detalles románticos personalizados (PHP + MySQL/MariaDB, sin frameworks).

## Instalación en XAMPP (5 pasos)
1. Copiá la carpeta `detalles_romanticos/` dentro de `C:\xampp\htdocs\`.
2. Iniciá **Apache** y **MySQL** desde el panel de XAMPP.
3. En phpMyAdmin → pestaña **SQL** → pegá el contenido de `database/detalles_romanticos.sql` → **Continuar**.
   (Borra y recrea las tablas; reemplaza las viejas `productos` y `detalle_pedidos`.)
   Si ya tenés la base creada y solo querés sumar las direcciones, usá `database/migracion_direccion.sql`.
4. Si tu MySQL tiene contraseña, editá `config/conexion.php` (por defecto: root, sin clave).
5. Abrí http://localhost/detalles_romanticos/

## Cuentas de prueba
| Rol | Email | Contraseña |
|---|---|---|
| Administrador | admin@amordetalle.com | Admin1234 |
| Cliente | cliente@amordetalle.com | Cliente1234 |

(Cambiarlas antes de publicar el sitio.)

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
