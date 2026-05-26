DROP TABLE IF EXISTS detalle_venta CASCADE;
DROP TABLE IF EXISTS venta CASCADE;
DROP TABLE IF EXISTS receta_detalle CASCADE;
DROP TABLE IF EXISTS producto CASCADE;
DROP TABLE IF EXISTS tipo_producto CASCADE;
DROP TABLE IF EXISTS ingrediente CASCADE;
DROP TABLE IF EXISTS unidad_medida CASCADE;
DROP TABLE IF EXISTS cliente CASCADE;
DROP TABLE IF EXISTS punto_venta CASCADE;



-- =========================================
-- TABLA: PUNTO DE VENTA
-- =========================================

CREATE TABLE punto_venta(
    id_punto_venta SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100)
);



-- =========================================
-- TABLA: CLIENTE
-- =========================================

CREATE TABLE cliente(
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20)
);



-- =========================================
-- TABLA: UNIDAD DE MEDIDA
-- =========================================

CREATE TABLE unidad_medida(
    id_unidad SERIAL PRIMARY KEY,
    nombre VARCHAR(20) UNIQUE NOT NULL,
    abreviatura VARCHAR(10) NOT NULL
);



-- =========================================
-- TABLA: INGREDIENTE
-- =========================================

CREATE TABLE ingrediente(
    id_ingrediente SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    costo_unitario NUMERIC(10,2) NOT NULL,
    id_unidad INTEGER NOT NULL,

    CONSTRAINT fk_ingrediente_unidad
    FOREIGN KEY(id_unidad)
    REFERENCES unidad_medida(id_unidad)
);



-- =========================================
-- TABLA: TIPO PRODUCTO
-- =========================================

CREATE TABLE tipo_producto(
    id_tipo SERIAL PRIMARY KEY,
    nombre VARCHAR(30) UNIQUE NOT NULL
);



-- =========================================
-- TABLA: PRODUCTO
-- =========================================

CREATE TABLE producto(
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    id_tipo INTEGER NOT NULL,
    precio_venta NUMERIC(10,2) NOT NULL,

    CONSTRAINT fk_producto_tipo
    FOREIGN KEY(id_tipo)
    REFERENCES tipo_producto(id_tipo)
);



-- =========================================
-- TABLA: RECETA DETALLE
-- Relación producto - ingrediente
-- =========================================

CREATE TABLE receta_detalle(
    id_producto INTEGER,
    id_ingrediente INTEGER,
    cantidad NUMERIC(10,3) NOT NULL,

    PRIMARY KEY(id_producto,id_ingrediente),

    CONSTRAINT fk_receta_producto
    FOREIGN KEY(id_producto)
    REFERENCES producto(id_producto),

    CONSTRAINT fk_receta_ingrediente
    FOREIGN KEY(id_ingrediente)
    REFERENCES ingrediente(id_ingrediente)
);



-- =========================================
-- TABLA: VENTA
-- =========================================

CREATE TABLE venta(
    id_venta SERIAL PRIMARY KEY,
    fecha TIMESTAMP NOT NULL,
    id_punto_venta INTEGER NOT NULL,
    id_cliente INTEGER,

    CONSTRAINT fk_venta_punto
    FOREIGN KEY(id_punto_venta)
    REFERENCES punto_venta(id_punto_venta),

    CONSTRAINT fk_venta_cliente
    FOREIGN KEY(id_cliente)
    REFERENCES cliente(id_cliente)
);



-- =========================================
-- TABLA: DETALLE VENTA
-- =========================================

CREATE TABLE detalle_venta(
    id_detalle SERIAL PRIMARY KEY,
    id_venta INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    cantidad NUMERIC(10,2) NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL,

    CONSTRAINT fk_detalle_venta
    FOREIGN KEY(id_venta)
    REFERENCES venta(id_venta),

    CONSTRAINT fk_detalle_producto
    FOREIGN KEY(id_producto)
    REFERENCES producto(id_producto)
);