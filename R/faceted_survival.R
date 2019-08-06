#' facets of a fitted survival object
#'
#' This function allows you facet a fitted survfit object. Generally, it is an modified version of
#' ggsurvplot_facet which uses geom_smooth for more comparison of the survival curve.
#' @param fit the fitted object
#' @param data the dataframe (or tibble) used to fit the survfit object
#' @param facet_vector the variable(s) to facet by, could be 1+ , must be a string
#' @param number of columns, default = 2
#' @param title obtional title for the plot
#' @keywords faceting
#' @export
#' @examples
#' facet_survival(fit_survival, dat, "beep", ncol = 3, title = "Faceted Survival Function")


facet_survival_comp <- function(fit, data, facet_vector, ncol = 2, title = NULL){
library(survminer)
ggsurvplot_facet(fit, data = data, facet.by = facet_vector)+
    theme_minimal()+ scale_colour_grey()+ facet_wrap(~strata, ncol = ncol)+
  geom_smooth(method = "loess", color = "darkred", se = F)+
  geom_smooth(method = "lm", color = "red", se = F)+
  labs(title = title, caption = "darkred = fit with loess, red = fit with lm")
}






