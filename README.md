# Bajo peso al nacer y contaminación del aire en Guatemala
**Autor:** Luis Villaseñor  
**Período de estudio:** 2009–2024 · **Estado:** en desarrollo

## Resumen del proyecto

El bajo peso al nacer constituye un problema de salud pública en Guatemala por su frecuencia y sus consecuencias para la supervivencia, el crecimiento y el desarrollo infantil. La contaminación del aire podría contribuir a este desenlace junto con otros determinantes sociales y ambientales, pero la evidencia en América Latina sigue siendo limitada.

Este proyecto utiliza registros de nacimientos de Guatemala de 2009–2024 para describir las tendencias y la estacionalidad del peso al nacer y del bajo peso al nacer (definido como un peso inferior a 2500 gramos), además de explorar diferencias entre territorios y características maternas.

En una etapa posterior, los registros se vincularán con estimaciones de material particulado fino (PM₂.₅) para estudiar su asociación con el bajo peso al nacer y orientar estrategias de protección de la salud maternoinfantil.

## Preguntas exploratorias

1. ¿Cómo han cambiado el peso al nacer y la proporción de bajo peso al nacer entre 2009 y 2024?
2. ¿Qué patrones estacionales se observan y cómo varían entre años?
3. ¿Qué diferencias existen entre departamentos y municipios de residencia materna?
4. ¿Cómo se distribuye el bajo peso al nacer según características maternas y del nacimiento?

## Fuentes de datos y confidencialidad

**Nacimientos:** registros administrativos del Registro Civil correspondientes a 2009–2024, en formatos SPSS (2009–2017) y Excel (2018–2024). Incluyen peso, fecha de nacimiento, residencia y características maternas, con disponibilidad variable entre años.

**Contaminación del aire (incorporación prevista):** estimaciones de PM₂.₅ del Atmospheric Composition Analysis Group (ACAG), basadas en información satelital y modelación. Su vinculación con los nacimientos está pendiente.

> **La base real no puede publicarse actualmente por motivos de confidencialidad.** La carpeta `01_datos/` contiene un Excel con los nombres de las columnas de la base real, sin registros individuales. No permite ejecutar los análisis por sí solo.

## Organización del proyecto

| Carpeta | Contenido |
|---|---|
| `01_datos/` | Excel con los nombres de las columnas. Los datos individuales se mantienen fuera del repositorio público. |
| `02_scripts/` | Código en R para importación, depuración, armonización, validación y análisis. |
| `03_resultados/` | Resultados agregados, figuras y tablas generados durante el proyecto. |

**Incorporaciones previstas, aún no creadas:** `04_docs/` para el diccionario de variables y las decisiones metodológicas; `03_resultados/figuras/` y `03_resultados/tablas/` para organizar las salidas. Se añadirán conforme avance el proyecto.

## Preparación de los datos

Se unifican los archivos anuales, se convierte el peso a gramos y se armonizan fechas y categorías. Se conservan los campos originales y los identificadores de archivo y fila para mantener la trazabilidad.

Los análisis principales se centrarán en nacimientos únicos con peso conocido. Los criterios territoriales dependerán del objetivo: los registros sin municipio identificado pueden contribuir a las tendencias nacionales, pero no a la asignación de exposición municipal.

Se informarán los valores desconocidos y los denominadores de cada descripción, sin exigir datos completos en todas las variables. Las decisiones y correcciones provisionales se detallarán en la documentación metodológica.

## Herramientas y reproducibilidad

- **R y RStudio:** preparación y análisis de los datos.
- **Paquetes de R:** importación de archivos SPSS y Excel, manipulación, procesamiento de fechas y visualización.
- **Git y GitHub:** control de versiones y documentación.

La secuencia de trabajo será **importación → armonización y validación → análisis descriptivo → integración de PM₂.₅ → análisis de asociación**.

La ejecución requiere acceso autorizado a los datos originales y las dependencias indicadas en los scripts. Se trabajará desde la raíz del proyecto con rutas relativas. Los comandos y el orden exacto de ejecución se documentarán al finalizar la reorganización del código.

## Estado actual y próximos pasos

Se han importado los datos, armonizado variables principales y realizado controles iniciales. Los próximos pasos son completar la documentación, revisar las decisiones pendientes, desarrollar las visualizaciones descriptivas e integrar la exposición a PM₂.₅. La vía del parto y los conteos de hijos mantienen aspectos de armonización pendientes; la ocupación materna queda fuera del análisis principal por problemas de comparabilidad.
