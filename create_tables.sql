
-- 1. Creo la base 
CREATE DATABASE EcommerceDB;
GO

USE EcommerceDB;
---------------------------------------------------------------------

-- Creo las tablas

-- Tabla de Clientes
CREATE TABLE Customer (
    id_customer INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    sexo CHAR(1),
    direccion TEXT,
    fecha_nacimiento DATE,
    telefono VARCHAR(30)
);


-- Tabla de Categorías de productos
CREATE TABLE Category (
    id_category INT PRIMARY KEY,
    nombre VARCHAR(100),
    path TEXT
);


-- Tabla de Ítems (productos en venta)
CREATE TABLE Item (
    id_item INT PRIMARY KEY,
    titulo VARCHAR(255),
    id_seller INT NOT NULL,
    id_category INT NOT NULL,
    precio DECIMAL(12,2),
    estado VARCHAR(20),
    fecha_baja DATE,
    FOREIGN KEY (id_seller) REFERENCES Customer(id_customer),
    FOREIGN KEY (id_category) REFERENCES Category(id_category)
);


-- Tabla de Órdenes (compras)
CREATE TABLE Orders (
    id_order INT PRIMARY KEY,
    id_buyer INT NOT NULL,
    fecha DATE,
    FOREIGN KEY (id_buyer) REFERENCES Customer(id_customer)
);

-- Tabla intermedia: ítems por orden
CREATE TABLE Order_Item (
    id_order INT NOT NULL,
    id_item INT NOT NULL,
    cantidad INT,
    precio_unitario DECIMAL(12,2),
    -- Agrego monto_total calculado automáticamente
    monto_total AS (cantidad * precio_unitario) PERSISTED,
    PRIMARY KEY (id_order, id_item),
    FOREIGN KEY (id_order) REFERENCES Orders(id_order),
    FOREIGN KEY (id_item) REFERENCES Item(id_item)
);

-- Tabla histórica de estados de ítems - historial de cambios de estado y precio
CREATE TABLE Item_Status_History (
    id_item INT NOT NULL,
    fecha DATE NOT NULL,
    precio DECIMAL(12,2),
    estado VARCHAR(20),
    PRIMARY KEY (id_item, fecha),
    FOREIGN KEY (id_item) REFERENCES Item(id_item)
);
----------------------------------------
-- Tabla de Snapshots diarios (reportes / cierres)
CREATE TABLE item_daily_snapshot (
    id_item INT,
    snapshot_date DATE,
    precio DECIMAL(18,2),
    estado VARCHAR(50),
    PRIMARY KEY (id_item, snapshot_date)
);


