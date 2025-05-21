USE EcommerceDB;

-- 1. Usuarios que cumplan años hoy y hayan vendido más de $1500 en enero 2020

SELECT 
    c.id_customer,
    c.nombre,
    c.apellido,
    SUM(oi.cantidad * oi.precio_unitario) AS total_ventas
FROM Customer c
JOIN Item i ON i.id_seller = c.id_customer
JOIN Order_Item oi ON oi.id_item = i.id_item
JOIN Orders o ON o.id_order = oi.id_order
WHERE 
    MONTH(c.fecha_nacimiento) = MONTH(GETDATE())
    AND DAY(c.fecha_nacimiento) = DAY(GETDATE())
    AND o.fecha BETWEEN '2020-01-01' AND '2020-01-31'
GROUP BY c.id_customer, c.nombre, c.apellido
HAVING SUM(oi.cantidad * oi.precio_unitario) > 1500;

-- SELECT * FROM Customer;

-----------

-- 2. Top 5 vendedores por mes de 2020 en categoría Celulares

WITH ranked_vendedores AS (
    SELECT 
        DATEFROMPARTS(YEAR(o.fecha), MONTH(o.fecha), 1) AS mes,
        c.nombre,
        c.apellido,
        COUNT(DISTINCT o.id_order) AS cantidad_ventas,
        SUM(oi.cantidad) AS cantidad_productos,
        SUM(oi.cantidad * oi.precio_unitario) AS monto_total,
        RANK() OVER (
            PARTITION BY DATEFROMPARTS(YEAR(o.fecha), MONTH(o.fecha), 1)
            ORDER BY SUM(oi.cantidad * oi.precio_unitario) DESC
        ) AS ranking
    FROM Orders o
    JOIN Order_Item oi ON o.id_order = oi.id_order
    JOIN Item i ON oi.id_item = i.id_item
    JOIN Category cat ON i.id_category = cat.id_category
    JOIN Customer c ON i.id_seller = c.id_customer
    WHERE 
        o.fecha BETWEEN '2020-01-01' AND '2020-12-31'
        AND LOWER(cat.nombre) LIKE '%celulares%'
    GROUP BY 
        DATEFROMPARTS(YEAR(o.fecha), MONTH(o.fecha), 1), c.nombre, c.apellido
)
SELECT *
FROM ranked_vendedores
WHERE ranking <= 5;
GO
-------------

-- 3. Poblar tabla con precio y estado del ítem al final del día (SP reprocesable)
--  Paso 1: Creo la tabla Item_Snapshot - tabla destino para guardar el snapshot diario

CREATE PROCEDURE sp_generar_snapshot_diario @fecha DATE
AS
BEGIN
    -- Borro si ya existe snapshot de esa fecha (reprocesable)
    DELETE FROM item_daily_snapshot WHERE snapshot_date = @fecha;

    -- Inserto últimos registros por ítem hasta esa fecha
    INSERT INTO item_daily_snapshot (id_item, snapshot_date, precio, estado)
    SELECT 
        ish.id_item,
        @fecha AS snapshot_date,
        ish.precio,
        ish.estado
    FROM Item_Status_History ish
    JOIN (
        SELECT 
            id_item,
            MAX(fecha) AS fecha_max
        FROM Item_Status_History
        WHERE fecha <= @fecha
        GROUP BY id_item
    ) ult ON ish.id_item = ult.id_item AND ish.fecha = ult.fecha_max;
END;


-- Ejecutar el SP para el 31 de enero de 2020
EXEC sp_generar_snapshot_diario '2020-01-31';

SELECT * FROM dbo.item_daily_snapshot;

---------------------

