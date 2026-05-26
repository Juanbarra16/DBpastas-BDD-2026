-- =========================================
-- PUNTOS DE VENTA
-- =========================================

INSERT INTO punto_venta(nombre,direccion)
VALUES
('Centro','San Martin 120'),
('Terminal','Bv España 540'),
('Costanera','Costanera 210'),
('Sur','Av Peron 1500');



-- =========================================
-- CLIENTES
-- =========================================

INSERT INTO cliente(nombre,apellido,telefono)
VALUES
('Juan','Perez','3534123456'),
('Maria','Lopez','3534987654'),
('Carlos','Gomez','3534556677'),
('Lucia','Martinez','3534778899');



-- =========================================
-- UNIDADES DE MEDIDA
-- =========================================

INSERT INTO unidad_medida(nombre,abreviatura)
VALUES
('Kilogramo','kg'),
('Unidad','u'),
('Litro','l');



-- =========================================
-- INGREDIENTES
-- =========================================

INSERT INTO ingrediente(nombre,costo_unitario,id_unidad)
VALUES
('Harina',900,1),
('Ricota',4200,1),
('Jamon',8500,1),
('Queso',7300,1),
('Papa',1200,1),
('Carne',9800,1),
('Huevos',250,2),
('Salsa',1800,3);



-- =========================================
-- TIPOS DE PRODUCTO
-- =========================================

INSERT INTO tipo_producto(nombre)
VALUES
('Relleno'),
('Simple'),
('Especial');



-- =========================================
-- PRODUCTOS
-- =========================================

INSERT INTO producto(nombre,id_tipo,precio_venta)
VALUES
('Ravioles Ricota',1,4500),
('Sorrentinos JyQ',1,5500),
('Tallarines',2,3200),
('Ñoquis',2,2800),
('Lasagna',3,6500);



-- =========================================
-- RECETAS
-- =========================================

-- Ravioles Ricota
INSERT INTO receta_detalle
VALUES
(1,1,0.35),
(1,2,0.25),
(1,7,2);

-- Sorrentinos Jamón y Queso
INSERT INTO receta_detalle
VALUES
(2,1,0.30),
(2,3,0.20),
(2,4,0.20);

-- Tallarines
INSERT INTO receta_detalle
VALUES
(3,1,0.50),
(3,7,1);

-- Ñoquis
INSERT INTO receta_detalle
VALUES
(4,5,0.60),
(4,1,0.15);

-- Lasagna
INSERT INTO receta_detalle
VALUES
(5,1,0.40),
(5,6,0.30),
(5,4,0.20),
(5,8,0.50);



-- =========================================
-- VENTAS
-- =========================================

INSERT INTO venta(fecha,id_punto_venta,id_cliente)
VALUES
('2026-05-01 10:30',1,1),
('2026-05-01 13:20',2,2),
('2026-05-02 18:40',3,3),
('2026-05-03 12:15',1,4),
('2026-05-03 19:10',4,1),
('2026-05-04 20:10',2,2);



-- =========================================
-- DETALLE VENTAS
-- =========================================

INSERT INTO detalle_venta
(id_venta,id_producto,cantidad,precio_unitario)
VALUES

(1,1,2,4500),
(1,3,1,3200),

(2,2,1,5500),

(3,5,2,6500),

(4,4,3,2800),

(5,2,2,5500),
(5,1,1,4500),

(6,3,2,3200),
(6,4,1,2800);