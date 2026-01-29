# Code by Javier Gonzalez
# for the project "YYYYYYY"


using Pkg  

#### THIS PATHS ARE ONLY FOR MY OWN COMPUTER ####
# REMEMBER: When sharing this code use the MacOS paths
# You might want to modify this set up for your own computer and folder structure
if Sys.isapple()
    # NOTE: the cd should be at the project level, not the `analysis` folder
    println("MacOS Set-up...")

    Pkg.activate("analysis/.pkgs") 
    Pkg.instantiate()

    path_data = "analysis/data/"
    path_telenovelas = "analysis/processed_data/telenovelas/"
    path_processed_data = "analysis/processed_data/"
    path_figures = "analysis/tables_figures/"
    path_utils = "analysis/routines/utils/"
    path_temp = "analysis/temp/"
else
    println("HPC Set-up...")

    Pkg.activate(".pkgs") 
    Pkg.instantiate()

    path_data = "data_hpc/"
    path_telenovelas = "processed_data/telenovelas_hpc/"
    path_processed_data = "processed_data/"
    path_figures = "tables_figures/"
    path_utils = "routines/utils/"
    path_temp = "temp/"
end

#### Need to add these packages before or bring the Project.toml ####
using StatsBase, Statistics, Random, MultivariateStats
using Printf
using LinearAlgebra, Polynomials
using DataFrames, Dates, Statistics 
using FixedEffectModels, GLM                      # Econometrics
using Binscatters: bin                            # Only extract the bins for the binscatter
using CairoMakie                                  # Ploting
using RegressionTables
using CSV, XLSX, JSON, Parquet                    # Load .csv, Excel, and .json files
using ProgressBars                                # to know the status of some parts of the codess
using Suppressor                                  # To suppress the output of the python script
using Colors, ColorSchemes
using ThreadsX                                    # For parallel computing        

# Include all project functions in the folder "functions"
println("- loading utils")
include("routines/utils/utils.jl");