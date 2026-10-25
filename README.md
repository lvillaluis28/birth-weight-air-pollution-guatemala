# Bajo peso al nacer y contaminación del aire en Guatemala

**Tendencias, territorio y salud desde el nacimiento (2009–2024)**

¿Cómo ha cambiado el peso al nacer en Guatemala y qué relación podría tener con la calidad del aire? Este proyecto analiza registros de nacimientos de 2009 a 2024 para describir el bajo peso al nacer y, en una etapa posterior, estudiar su asociación con la exposición a material particulado fino (PM₂.₅).

## 🎯 Objetivos

- Describir las tendencias anuales y la estacionalidad del peso al nacer y del bajo peso al nacer (<2500 g).
- Explorar diferencias territoriales y según características maternas y del nacimiento.
- Integrar información de contaminación del aire para evaluar su asociación con el bajo peso al nacer.

## 📁 Organización del repositorio

| Carpeta | Contenido |
|---|---|
| `01_datos/` | Archivo Excel con los **nombres de las columnas de la base real**, como referencia de su estructura. Los datos individuales no están incluidos. |
| `02_scripts/` | Scripts en **R** para importar, depurar, armonizar y validar los datos, y desarrollar los análisis. |
| `03_resultados/` | Resultados del proyecto, incluidas figuras, tablas y resúmenes agregados, conforme avance el análisis. |

**Organización prevista:** se incorporará `04_docs/` para documentar el diccionario de variables, las decisiones de armonización y los criterios de selección. También se prevén las subcarpetas `03_resultados/figures/` y `03_resultados/tables/` para separar figuras y tablas. Estas incorporaciones **aún no se han creado** y se añadirán conforme avance el proyecto.

## 🔒 Datos y confidencialidad

**Actualmente, la base real no puede publicarse por motivos de confidencialidad.** El Excel de `01_datos/` permite conocer los nombres de sus columnas sin divulgar registros individuales; no es una base de ejemplo ni permite reproducir los análisis por sí solo.

El repositorio busca compartir el código, la documentación y los resultados agregados que puedan difundirse respetando la confidencialidad. La ejecución completa requiere acceso autorizado a los datos originales.

## 🛠️ Flujo de trabajo y estado actual

El trabajo sigue una secuencia de **importación → armonización y validación → análisis descriptivo → integración de exposición a PM₂.₅ → análisis de asociación**.

El proyecto está **en desarrollo**, en la etapa de preparación de los datos y organización de los scripts. Algunas decisiones de armonización siguen siendo provisionales y deberán documentarse antes de utilizar las variables correspondientes. Los criterios de selección se definirán según cada objetivo: la disponibilidad de municipio, por ejemplo, es necesaria para asignar exposición territorial, pero no debe exigirse automáticamente para describir tendencias nacionales.

---

**Autor:** Luis Villaseñor · Estudiante del Doctorado en Epidemiología, Pontificia Universidad Católica de Chile.
