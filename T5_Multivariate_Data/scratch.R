
## Two quantitative and one qualitative

R code

## Two qualitative and one quantitative variable

a

## Three quantitative variables

aa

## Three categorical variables

# Actividad

## Emphasize the important difference

The activity may be about selecting the best graphs among two possibilities. When we show the answer we can include the code to generate the plot.

-   Emphasize

-   Ordering

-   Stacking

<https://learningds.org/ch/11/viz_comparisons.html>
  
  # Applying principle 3
  
  ## Adding context
  
  We have used text in our graphs throughout this chapter to provide meaningful axis labels that include units of measurement, tick-mark labels for categories, and titles

A good goal is to include enough context in a plot so that it can stand alone—a reader should be able to get the gist of the plot without needing to search for explanation elsewhere.

That said, every element of a statistical graph should have a purpose.

## Labels and captions

Text context includes *labels* and *captions*. It is a good practice to consistently use informative labels on tick marks and axes.

Example of bad and good labels

Informative labels are especially important for plots that other people will see and interpret.

## 

Captions serve several purposes. They describe what has been plotted and orient the reader. Captions also point out important features of the plot and comment on their implications.

\[Examples of good and bad captions\]

::: notes
Readers often skim a publication and focus on section headings and visualizations, so plot captions should be self-contained.
:::
  
  ## Reference Markers
  
  *Reference markers* bring additional context to the plotting region. Reference points and lines that provide benchmarks, historical values, and other external information help form comparisons and interpretations.

\[EXAMPLES OF LABELING MARKERS\]

::: notes
For example, we often add a reference line with slope 1 to a quantile-quantile plot. We might also add a vertical line on a time-series plot to mark a special event, like a natural disaster.
:::
  
  ## Ajustando los tick marks
  
  ¿Es apropiado incluir el zero o no?
  
  Ejemplo de histograma sin zero y con zero.

## Transformaciones

Another common way to adjust scale is to transform the data or the plot’s axes. We use transformations for skewed data so that it is easier to inspect the distribution.

And when the transformation produces a symmetric distribution, the symmetry carries with it useful properties for modeling (which we will see later).

There are multiple ways to transform data, but the log transformation tends to be especially useful.

## The log transformation

The log transform can reveal several common types of relationships. Because of this, the log transform is considered the jackknife of transformations.

![](images/Screenshot%202024-01-30%20at%201.32.44%20p.m..png){fig-align="center"}

## What do you see?

Show image in r

This is *overplotting*, where we have overlapping points because of a large dataset.

## Smoothing

We can find high-density regions of a scatter plot by binning data, like in a histogram. The following plot, remakes the earlier scatter plot of the Cherry Blossom race times against age. This plot uses hexagonal bins to aggregate points together, and then shades the hexagons based on how many points fall in them:
  
  \[SHOW PLOT WITH AND WITHOUT SMOOTHING\]

## Another important application

Another smoothing approach that is often more informative smooths the y-values for points with a similar x-value. To explain, let’s group together runners with similar ages; we use five-year increments: 20–25, 25–30, 30–35, and so on. Then, for each five-year bin of runners, we average their race times, plot the average time for each group, and connect the points to form a “curve”:
  
  \[SHOW PLOT WITH AND WITHOUT SMOOTHING\]

## When not to smooth

Smoothing and aggregating can help us see important features and relationships, but when we have only a handful of observations, smoothing techniques can be misleading.

With just a few observations, we prefer rug plots over histograms, box plots, and density curves, and we use scatter plots rather than smooth curves and density contours.

\[SHOW R CODE WITH BOXPLOT AND STRIPLOT\]

::: notes
One of the most common misuses of smoothing happens with box plots. As an example, here is a collection of seven box plots of longevity, one for each of seven types of dog breed:
  
  Some of these box plots have as few as two or three observations. The strip plot that follows is a preferable visualization:
  
  In this plot, we can still compare the groups, but we also see the exact values in each group. Now we can tell that there are only three breeds in the non-sporting group; the impression of a skewed distribution, based on the box plot, reads too much into the shape of the box.
:::
  
  
  ## Histograma por grupo
  
  La gráfica de facetas se puede usar para crear otro tipo de gráficas por grupo. 

Por ejemplo, si queremos visualizar la distribución de la masa corporal de los pingüinos (`body_mass_g`) por especie hacemos lo siguiente:
  
  ```{r}
#| fig-pos: center
#| echo: true

gf_histogram( ~ body_mass_g, data = penguins_data) %>% gf_facet_grid(species ~ .) 
```

## Aplicando el principio 3

```{r}
#| fig-pos: center
#| echo: true
#| code-fold: true


mi_hist_facetas <- gf_histogram( ~ body_mass_g, data = penguins_data, color = "black", fill = "darkblue") %>% gf_facet_grid(species ~ .) 
mi_hist_facetas <- mi_hist_facetas + labs(x = "Masa corporal (g)", y = "Frecuencia")
mi_hist_facetas <- mi_hist_facetas + theme(axis.text=element_text(size=18), axis.title=element_text(size=18))
mi_hist_facetas
```
