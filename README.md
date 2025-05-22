![ruta_o_url_de_la_imagen](https://github.com/Floryofre/Challenge-Engineer---SQL/blob/main/Banner%20de%20LinkedIn%20Lugar%20de%20Trabajo%20Ordenado%20(2).jpg)
# Proyecto de Análisis de Ventas

## Descripción

Este proyecto consiste en la creación y poblamiento de una base de datos para analizar ventas de ítems, enfocándose en usuarios y productos dentro de la categoría "Celulares" durante el año 2020. Se realizan consultas de negocio para obtener datos relevantes para la toma de decisiones comerciales.

---

## Tecnologías utilizadas

- SQL Server Management Studio 

---

## Contenidos del repositorio

- **create_tables.sql**: Script para creación de tablas y relaciones.
- **insert_data.sql**: Script para poblar las tablas con datos de ejemplo.
- **respuestas_negocio.sql**: Consultas que responden a las preguntas de negocio planteadas.
- **Diagrama ER (DER)**: Representación gráfica del modelo de datos.

---

## Instrucciones para ejecutar

1. Crear la base de datos desde cero (se recomienda borrar si existe).
2. Ejecutar el script `create_tables.sql` para crear las tablas.
3. Ejecutar el script `insert_data.sql` para poblar los datos.
4. Ejecutar el script `respuestas_negocio.sql` para obtener las respuestas a las preguntas de negocio.

---

## 📌 Requisitos de negocio

### 1. 🎂 Usuarios que cumplen años hoy y que hayan vendido más de $1500 en enero 2020

**Resultado esperado:**

| id_customer | Nombre | Apellido | Monto Total |
|-------------|--------|----------|-------------|
| 1           | Juan   | Pérez    | 3900.00     |

---

### 2. 🏆 Top 5 vendedores por mes en categoría Celulares (año 2020)

Se solicita para cada mes:

- Mes y año de análisis
- Nombre y apellido del vendedor
- Cantidad de ventas realizadas
- Cantidad de productos vendidos
- Monto total transaccionado
- Ranking de 1 a 5 (top 5 estrictamente, incluyendo empates)

**Ejemplo de resultado:**

| Mes         | Nombre  | Apellido    | Ventas | Productos | Monto   | Ranking |
|-------------|---------|-------------|--------|-----------|---------|---------|
| 2020-01-01  | Juan    | Pérez       | 3      | 4         | 3900.00 | 1       |
| 2020-01-01  | Luis    | Martínez    | 1      | 3         | 2100.00 | 2       |
| 2020-02-01  | Carla   | López       | 1      | 2         | 1300.00 | 1       |
| 2020-02-01  | Juan    | Pérez       | 1      | 1         | 1000.00 | 2       |
| 2020-03-01  | Luis    | Martínez    | 1      | 2         | 1400.00 | 1       |
| 2020-03-01  | Pablo   | Díaz        | 1      | 1         | 800.00  | 2       |
| 2020-04-01  | Laura   | Morales     | 1      | 4         | 3000.00 | 1       |
| 2020-04-01  | Carla   | López       | 1      | 3         | 1950.00 | 2       |
| 2020-05-01  | Pablo   | Díaz        | 1      | 2         | 1600.00 | 1       |
| 2020-05-01  | Laura   | Morales     | 1      | 1         | 750.00  | 2       |

---

### 3. 🕒 Histórico de precios y estados al final del día

Se registra el precio y estado vigente de cada ítem para fechas específicas, con la capacidad de reprocesar los datos a través de un procedimiento almacenado.

**Ejemplo para el 31 de enero de 2020:**

| id_item | Fecha      | Precio  | Estado |
|---------|------------|---------|--------|
| 1       | 2020-01-31 | 1000.00 | activo |
| 2       | 2020-01-31 | 900.00  | activo |

---

## Contacto

Para cualquier consulta, sugerencia o duda, contactarse al email: maflorencia@gmail.com

---

¡Gracias por revisar este proyecto!

