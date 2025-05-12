# Updated on: 2024-01-27
# Code by Javier Gonzalez
# for the project "Aggregate Costs of Women Misallocation of Talent"
# Objective: replicate the LaTeX table X from the paper

x_points = -5:0.01:5
f2(x) = x^2 + 2

p1 = plot(x_points,f2.(x_points), size = (900,600), fmt = :svg)
display(p1)
savefig(p1,"tables_figures/figure_x.svg")
