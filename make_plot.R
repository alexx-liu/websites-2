library(tidyverse)

billboard_data <- read_rds("clean_data.rds")

billboard_plot <- billboard_data |>
  ggplot(aes(week, rank, color = song)) +
  geom_line(linewidth = 1.1) +
  geom_point(size = 1.4) +
  facet_wrap(~ song, ncol = 1) +
  scale_y_reverse() +
  scale_color_brewer(palette = "Dark2", guide = "none") +
  labs(
    title = "How long the biggest Billboard hits stayed on the chart",
    subtitle = "Each panel shows one song's weekly rank; smaller numbers mean a better chart position.",
    x = "Week on chart",
    y = "Billboard rank"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.minor = element_blank(),
    strip.text = element_text(face = "bold"),
    plot.title = element_text(face = "bold")
  )

ggsave("billboard.png", plot = billboard_plot)
