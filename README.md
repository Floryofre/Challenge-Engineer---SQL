# Challenge-Engineer---SQL
**# 📊 Proyecto SQL – Análisis de Ventas por Categoría

Este proyecto consiste en la creación y análisis de una base de datos simulada para una tienda online, con foco en las ventas realizadas por vendedores en la categoría **Celulares** durante el año 2020.

## 🧠 Objetivo del Proyecto

Obtener información clave sobre el rendimiento de los vendedores, en especial:

- Qué usuarios cumplieron años hoy y realizaron ventas mayores a $1500 en enero de 2020.
- El **Top 5 de vendedores por mes del año 2020** en la categoría **Celulares**, incluyendo cantidad de ventas, cantidad de productos vendidos y monto total.
- Crear un histórico del precio y estado de cada ítem al finalizar el día, utilizando un procedimiento almacenado reprocesable.

---

## 🧱 Estructura de la Base de Datos

La base está compuesta por las siguientes tablas principales:

- `Customer` – Clientes y vendedores.
- `Item` – Productos ofertados.
- `Category` – Categorías de productos.
- `Orders` – Ventas realizadas.
- `Order_Item` – Detalle de productos en cada orden.
- `Item_History` – Histórico de precios y estado del ítem.

Además, se incluye el **modelo entidad-relación (DER)** en formato imagen: `modelo_ER.png`.

---

## 📂 Scripts incluidos

- `create_tables.sql` – Crea la estructura de la base de datos.
- `insert_data.sql` – Inserta datos simulados para poblar las tablas.
- `respuestas_negocio.sql` – Contiene las consultas de análisis solicitadas.

---

## 📌 Requisitos de negocio

### 1. Cumpleaños + ventas en enero 2020
> Usuarios que cumplan años hoy y hayan vendido más de $1500 en enero de 2020.

```sql
-- Resultado esperado (ejemplo)
1 | Juan | Pérez | 3900.00
**
