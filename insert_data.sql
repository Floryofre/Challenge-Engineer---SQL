USE EcommerceDB;


-- Insertar Customers -----------
INSERT INTO Customer (id_customer, email, nombre, apellido, sexo, direccion, fecha_nacimiento, telefono)
VALUES 
(1, 'juan.perez@mail.com', 'Juan', 'Pérez', 'M', 'Calle Falsa 123', '1985-05-21', '1122334455'),
(2, 'ana.lopez@mail.com', 'Ana', 'López', 'F', 'Av. Siempreviva 742', '1990-05-21', '1144556677'), -- Cumple hoy
(3, 'maria.gomez@mail.com', 'María', 'Gómez', 'F', 'Diagonal 80', '1987-07-15', '1199887766'),
(4, 'luis.martinez@mail.com', 'Luis', 'Martínez', 'M', 'Calle 123', '1980-06-15', '1155667788'),
(5, 'carla.lopez@mail.com', 'Carla', 'López', 'F', 'Av. Central 456', '1988-08-20', '1166778899'),
(6, 'pablo.diaz@mail.com', 'Pablo', 'Díaz', 'M', 'Calle 789', '1992-09-25', '1177889900'),
(7, 'laura.morales@mail.com', 'Laura', 'Morales', 'F', 'Av. Siempre Viva 300', '1991-03-30', '1199001122');


SELECT * FROM Customer;


-- Insertar Categorías ---------------

INSERT INTO Category (id_category, nombre, path)
VALUES 
(1, 'Celulares y Smartphones', 'Tecnología > Celulares y Teléfonos > Celulares y Smartphones'),
(2, 'Computadoras', 'Tecnología > Computadoras');

SELECT * FROM Category;


-- Insertar Items -----------------

INSERT INTO Item (id_item, titulo, id_seller, id_category, precio, estado, fecha_baja)
VALUES
(1, 'iPhone 12', 1, 1, 1000.00, 'activo', NULL),
(2, 'Samsung Galaxy S21', 1, 1, 900.00, 'activo', NULL),
(3, 'Notebook HP', 3, 2, 1200.00, 'pausado', '2023-12-01'),
(4, 'Xiaomi Redmi Note 10', 4, 1, 700.00, 'activo', NULL),
(5, 'Motorola Moto G9', 5, 1, 650.00, 'activo', NULL),
(6, 'Huawei P40', 6, 1, 800.00, 'activo', NULL),
(7, 'OnePlus 8T', 7, 1, 750.00, 'activo', NULL);

SELECT * FROM Item;


-- Insertar Orders

INSERT INTO Orders (id_order, id_buyer, fecha)
VALUES
(1, 2, '2020-01-10'),
(2, 2, '2020-01-11'),
(3, 3, '2020-02-05'),
(4, 2, '2020-01-15'),
(5, 2, '2020-02-10'),
(6, 2, '2020-03-05'),
(7, 2, '2020-03-20'),
(8, 3, '2020-01-22'),
(9, 4, '2020-04-01'),
(10, 5, '2020-04-15'),
(11, 6, '2020-05-10'),
(12, 7, '2020-05-25');

SELECT * FROM Orders;


-- Insertar Order_Item

INSERT INTO Order_Item (id_order, id_item, cantidad, precio_unitario)
VALUES
(1, 1, 2, 1000.00), -- 2 iPhones vendidos
(2, 2, 1, 900.00),  -- 1 Samsung vendido
(3, 1, 1, 1000.00), -- fuera de enero
(4, 4, 3, 700.00),  -- Luis vende 3 Xiaomi en ene 2020
(5, 5, 2, 650.00),  -- Carla vende 2 Motorola en feb 2020
(6, 6, 1, 800.00),  -- Pablo vende 1 Huawei en mar 2020
(7, 4, 2, 700.00),  -- Luis vende 2 Xiaomi en mar 2020
(8, 1, 1, 1000.00), -- Juan vende 1 iPhone en ene 2020
(9, 7, 4, 750.00),  -- Laura vende 4 OnePlus en abr 2020
(10, 5, 3, 650.00), -- Carla vende 3 Motorola en abr 2020
(11, 6, 2, 800.00), -- Pablo vende 2 Huawei en may 2020
(12, 7, 1, 750.00); -- Laura vende 1 OnePlus en may 2020

SELECT * FROM Order_Item;


-- Insertar Item_Status_History

INSERT INTO Item_Status_History (id_item, fecha, precio, estado)
VALUES
(1, '2020-01-31', 1000.00, 'activo'),
(2, '2020-01-31', 900.00, 'activo');

SELECT * FROM Item_Status_History;


-- Insertar item_daily_snapshot

INSERT INTO item_daily_snapshot (id_item, snapshot_date, precio, estado)
VALUES
(1, '2020-01-31', 1000.00, 'activo'),
(2, '2020-01-31', 900.00, 'activo'),
(3, '2020-01-31', 1200.00, 'pausado'); 

SELECT * FROM item_daily_snapshot;
