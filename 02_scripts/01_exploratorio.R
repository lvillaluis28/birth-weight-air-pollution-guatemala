# =============================================================================
# PROYECTO: Bajo peso al nacer en Guatemala, 2009–2024
# SCRIPT: 01_exploratorio.R
# OBJETIVO:
#   Realizar el análisis exploratorio inicial reproducible de la base analítica final.
#
# BASE PRINCIPAL:
#   births_harmonized_2009-2024  -> base analítica armonizada (31 variables)

# =============================================================================
# 0. PAQUETES Y COMPROBACIONES INICIALES
# =============================================================================

library(dplyr)
library(tidyr)
library(ggplot2)
library(readr)
library (here)
library(scales)

# Importar base de datos
birth_imported <- readRDS(
  here::here("02_outputs", "births_harmonized_2009_2024.rds")
)

# Comprobar dimensiones esperadas de la base analítica
stopifnot(
  nrow(base_reducida) == 5727242,
  ncol(base_reducida) == 31
)

# =============================================================================
# 1. DESCRIPCIÓN GENERAL Y TENDENCIA ANUAL
# =============================================================================
# -----------------------------------------------------------------------------
# 1.1 Número de nacimientos por año
# -----------------------------------------------------------------------------

nacimientos_anuales <- birth_imported |>
  count(
    birth_year,
    name = "births"
  ) |>
  arrange(birth_year)

ggplot(
  nacimientos_anuales,
  aes(
    x = birth_year,
    y = births
  )
) +
  geom_line(
    linewidth = 0.8
  ) +
  geom_point(
    size = 2
  ) +
  scale_x_continuous(
    breaks = seq(
      min(nacimientos_anuales$birth_year),
      max(nacimientos_anuales$birth_year),
      by = 1
    )
  ) +
  scale_y_continuous(
    labels = label_comma()
  ) +
  labs(
    x = "Año",
    y = "Número de nacimientos"
  ) +
  theme_classic() +
  theme(
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    )
  )

ggsave(
  filename = here::here(
    "03_resultados",
    "fig-1_nacimientos_anuales_2009_2024.png"
  ),
  width = 8,
  height = 5,
  units = "in",
  dpi = 300
)


# ============================================================
# MISSING EN EDUCACIÓN Y EDAD MATERNA POR AÑO
# ============================================================

missing_maternas_anual <- birth_imported |>
  group_by(birth_year) |>
  summarise(
    births = n(),
    
    missing_maternal_education =
      sum(is.na(maternal_education_group)),
    
    missing_maternal_age =
      sum(is.na(maternal_age)),
    
    missing_maternal_education_pct =
      100 * missing_maternal_education / births,
    
    missing_maternal_age_pct =
      100 * missing_maternal_age / births,
    
    .groups = "drop"
  )

print(
  missing_maternas_anual,
  n = Inf
)


# ============================================================
# FORMATO LARGO PARA GRAFICAR
# ============================================================

missing_maternas_plot <- missing_maternas_anual |>
  select(
    birth_year,
    missing_maternal_education_pct,
    missing_maternal_age_pct
  ) |>
  pivot_longer(
    cols = -birth_year,
    names_to = "variable",
    values_to = "missing_pct"
  ) |>
  mutate(
    variable = recode(
      variable,
      missing_maternal_education_pct = "Nivel educativo materno",
      missing_maternal_age_pct = "Edad materna"
    )
  )


# ============================================================
# SERIE DE TIEMPO
# ============================================================

fig_missing_maternas <- ggplot(
  missing_maternas_plot,
  aes(
    x = birth_year,
    y = missing_pct,
    group = variable,
    linetype = variable,
    shape = variable
  )
) +
  geom_line(
    linewidth = 0.9
  ) +
  geom_point(
    size = 2.2
  ) +
  scale_x_continuous(
    breaks = seq(
      min(missing_maternas_plot$birth_year),
      max(missing_maternas_plot$birth_year),
      by = 1
    )
  ) +
  scale_y_continuous(
    labels = label_number(
      accuracy = 0.1,
      suffix = "%"
    )
  ) +
  labs(
    x = "Año",
    y = "Registros faltantes (%)",
    linetype = NULL,
    shape = NULL
  ) +
  theme_classic() +
  theme(
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    ),
    legend.position = "top"
  )

fig_missing_maternas

ggsave(
  filename = here::here(
    "03_resultados",
    "fig-2_missing_educacion_edad_materna_2009_2024.png"
  ),
  plot = fig_missing_maternas,
  width = 8,
  height = 5,
  units = "in",
  dpi = 300
)