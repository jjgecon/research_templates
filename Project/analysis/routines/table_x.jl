# Updated on: 2024-01-27
# Code by Javier Gonzalez
# for the project "Aggregate Costs of Women Misallocation of Talent"
# Objective: replicate the LaTeX table X from the paper

@load "model_data/optimum.jld2" x_minimizer
x1 = @sprintf("%.2f", x_minimizer[1])
x2 = @sprintf("%.2f", x_minimizer[2])

open("tables_figures/table_X.tex", "w") do io
    # Document start
    println(io, raw"\documentclass[12pt]{article}")
    println(io, raw"\begin{document}")
    println(io, raw"")

    # Table
    println(io, raw"\begin{table}")
    println(io, raw"\caption{Title}")
    println(io, raw"\bigskip")
    println(io, raw"\centering{}%")
    println(io, raw"\begin{tabular}{ccc}\hline ")
    println(io, raw"& $x_1$ & $x_2$\tabularnewline\hline ")
    print(  io, "Var 1 & $x1 & $x2 ")
    println(io, raw"\tabularnewline\hline")
    println(io, raw"\end{tabular}")
    println(io, raw"\end{table}")
    println(io, raw"")

    # Document end
    println(io, raw"\end{document}")
end