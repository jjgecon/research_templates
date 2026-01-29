# Updated on: 2025-05-12

"""
A simple function to returns errors but keep the code running
"""
function try_catch(func)
    try
        func()  # run the function
    catch e
        println("An error occurred in ", func, ": ", e)
    end
end

meanₘ(x) = mean(skipmissing(x))
meanₘ(x, w) = mean(skipmissing(x), weights(collect(skipmissing(w))))
sumₘ(x) = sum(skipmissing(x))
stdₘ(x) = std(skipmissing(x))
medianₘ(x) = median(skipmissing(x))
function maximumₘ(x)
    s = skipmissing(x)
    isempty(s) ? missing : maximum(s)
end

function minimumₘ(x)
    s = skipmissing(x)
    isempty(s) ? missing : minimum(s)
end

function firstₘ(x)
    if ismissing(x)
        return missing
    else
        return first(x)
    end
end

"""
This function takes a vector of dates and returns the "mean date" by using
the UTD values in interger form
"""
function date_mean(dates_vector)
    numerical_values = Dates.value.(dates_vector)
    mean_value = round(mean(numerical_values))
    return Date(Dates.UTD(mean_value))
end

"""
This function takes a vector of time, transforms it to milisecods 
and returns the mean time as a Time type with HH:MM:SS.

#FIXME: THERE MIGHT BE SOMETHING WRONG WITH THIS FUNCTION
"""
function time_mean(times_vector)
    aux_sec = Dates.value.(coalesce.(times_vector,Time(0,0,1))) ./ 1000000
    aux_milisec = aux_sec[aux_sec .!= 1]
    milis = round(mean(aux_milisec))
    return Time(milis ÷ 3600000, (milis ÷ 60000) % 60, (milis ÷ 1000) % 60)
end

"""
This function takes a vector of time, transforms it to milisecods 
and returns the std time as a Time type with HH:MM:SS.

#FIXME: THERE MIGHT BE SOMETHING WRONG WITH THIS FUNCTION
"""
function time_std(times_vector)
    aux_sec = Dates.value.(coalesce.(times_vector,Time(0,0,1))) ./ 1000000
    aux_milisec = aux_sec[aux_sec .!= 1]
    milis = round(std(aux_milisec))
    return Time(milis ÷ 3600000, (milis ÷ 60000) % 60, (milis ÷ 1000) % 60)
end

#dealing with missings
|ₘ(x, y) = ismissing(x) | ismissing(y) ? false : x | y;
andₘ(x, y) = ismissing(x) | ismissing(y) ? false : x & y;
!=ₘ(x, y) = ismissing(x) | ismissing(y) ? false : x != y;
==ₘ(x, y) = ismissing(x) | ismissing(y) ? false : x == y;
>=ₘ(x, y) = ismissing(x) | ismissing(y) ? false : x >= y;
<=ₘ(x, y) = ismissing(x) | ismissing(y) ? false : x <= y;
<ₘ(x, y) = ismissing(x) | ismissing(y) ? false : x < y;
>ₘ(x, y) = ismissing(x) | ismissing(y) ? false : x > y;
∈ₘ(x,y) = ismissing(x) | ismissing(y) ? false : x ∈ y;


parseₘ(type,x) = ismissing(x) ? missing : parse(type,x);
Intₘ(x) = ismissing(x) ? missing : Int(x);


# Load FIPS 2 ISO data
iso_fips = DataFrame(CSV.File(path_data * "misc/fips_2_iso_full.csv"))

function get_iso(country::String)
    country_to_look = lowercase(country)
    return iso_fips[iso_fips.country .== country_to_look,:iso2]
end

iso_region = DataFrame(CSV.File(path_data * "misc/iso_with_region_codes.csv"))
iso_region = iso_region[:,["alpha-2","alpha-3","region-code","region"]]
rename!(iso_region, Dict("alpha-2" => :iso2, "alpha-3" => :iso3))

"""
This function calculates the minimum distance between a date and a list of dates 
and then assigns the index of the closest date in the list.

Used for grouping dates between some distance appart.
"""
function calculate_min_distance_index(date_list, date, date_return = true)
    if date_return
        return date_list[argmin(abs.(date_list .- date))]
    else
        return argmin(abs.(date_list .- date))
    end
end

"""
"""
function assign_both(val1,val2, both_decision = "first")
    if ismissing(val1) & ismissing(val2)
        return missing
    elseif !(ismissing(val2)) & ismissing(val1)
        return val2
    elseif ismissing(val2) & !(ismissing(val1))
        return val1
    else
        if both_decision == "sum"
            return val1 + val2
        elseif both_decision == "mult"
            return val1 * val2
        elseif both_decision == "second"
            return val2
        else
            return val1
        end
    end
end

function print_df_names(df)
    for name in names(df)
        println(name)
    end
end

function map_values(value, map_dictionary, verbose = false)
    # @show typeof(value)
    try
        return map_dictionary[value]
    catch e
        if isa(e, KeyError) && e.key === missing
            # Silently handle missing key error
        else
            if verbose
                print(e)
                println(" returning original key")
            end
        end
        return value
    end
end

fix_LaTeX_letters_dict = Dict("ã" => raw"{\~a}", "á" => raw"{\'a}", "í" => raw"{\'i}", "ó" => raw"{\'o}", "ú" => raw"{\'u}", "ñ" => raw"{\~n}", "à" => raw"{\`a}", "é" => raw"{\'e}", "ç" => raw"{\c{c}}")

fix_letters_dict = Dict("ã" => raw"a", "á" => raw"a", "í" => raw"i", "ó" => raw"o", "ú" => raw"u", "ñ" => raw"n", "à" => raw"a", "é" => "e")

function transform_string_with_dict(input_string::String, dict)
    for (key, value) in dict
        input_string = replace(input_string, key => value)
    end
    return input_string
end

function get_z_score(vector)
    m = meanₘ(vector)
    s = stdₘ(vector)
    return (vector .- m) ./ s
end

# Load other utils
for file in readdir(path_utils)
    if occursin(".jl", file) & (file != "utils.jl")
        println("-- " * file)
        include(file)
    end
end

"""
    create_stratified_sample_optimized(df::DataFrame, sample_size::Int; n_per_stratum::Int=5, stratum_col::Symbol=:stratum)

Create a stratified random sample from a DataFrame, ensuring at least `n_per_stratum` samples are drawn (with replacement) from each stratum defined by `stratum_col`. The function then fills the remaining required rows (to reach `sample_size`) by sampling from the entire DataFrame, also with replacement.

# Arguments
- `df::DataFrame`: The input DataFrame to sample from.
- `sample_size::Int`: The total number of rows to include in the final sample.
- `n_per_stratum::Int=5`: The minimum number of samples to draw from each stratum (default: 5).
- `stratum_col::Symbol=:stratum`: The column used to define strata. This can be a single column or a new column created by combining multiple columns, e.g., `df.group1 .* "-" .* df.group2`.

# Returns
- `final_sample::DataFrame`: A DataFrame containing the stratified sample.

# Notes
- Sampling is done with replacement.
- If the total number of guaranteed samples (from all strata) is less than `sample_size`, the remaining rows are sampled from the entire DataFrame.
- To define a stratum based on multiple columns, you can create a new column in your DataFrame, for example:
  ```julia
  df.stratum = df.group1 .* "-" .* df.group2
  ```
  and then pass `stratum_col=:stratum`.
"""
function create_stratified_sample(df::DataFrame, sample_size::Int; n_per_stratum::Int=5, stratum_col::Symbol=:stratum)
    
    # Group the dataframe by the stratum column
    gdf = groupby(df, stratum_col)
    
    # Use combine for a more direct and faster group-wise sample
    guaranteed_df = combine(gdf) do sdf
        indices = sample(1:nrow(sdf), n_per_stratum, replace=true)
        sdf[indices, :]
    end

    n_remaining = sample_size - nrow(guaranteed_df)
    
    # Sample the rest and combine
    if n_remaining > 0
        remaining_indices = sample(1:nrow(df), n_remaining, replace=true)
        remaining_df = df[remaining_indices, :]
        # Note: We must drop the grouping column from guaranteed_df if it exists
        # to ensure vcat works smoothly. `combine` can sometimes add it.
        # However, in this specific lambda-function form, it does not.
        final_sample = vcat(guaranteed_df, remaining_df)
    else
        final_sample = guaranteed_df
    end
    
    return final_sample
end;