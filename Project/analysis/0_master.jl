# Updated on: 2024-01-27
# Code by Javier Gonzalez
# for the project "YYYYYYY"


## SET UP ##
# REMEMBER TO ACTIVATE A NEW ENVIROMENT _pkg AND ADD THE PACKAGES NEEDED
using Pkg
Pkg.activate("_pkgs")              # Activate enviroment
Pkg.instantiate()                  # Load the needed packages

using Optim                      # Optiomization package
using JLD2                       # Save data
using Printf                     # Create strings with x decimals
using Plots


# Include all proyect functions in the folder "functions"
for file in readdir("functions")
    println("Loading " * file)
    include("functions/" * file)
end
## FIND ROOT ## 

println("Finding root... \n")

x_minimizer = foo2(f,[2.0,1.5])
@save "model_data/optimum.jld2" x_minimizer

## RESULT TABLES ## 

println("Exporting table X... \n")
include("table_x.jl")

## PLOT ##

println("Ploting figure X... \n")
include("figure_x.jl")