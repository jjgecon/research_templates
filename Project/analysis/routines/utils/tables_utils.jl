


# Generate significance starts
"""
"""
function significant_starts_sd(sd, coef, output_type = "typst")
    t_stat = abs(coef / sd)
    if t_stat > 2.576
        # at the 1% level
        if output_type == "typst"
            return raw"\*\*\*"
        else
            return "***"
        end
    elseif t_stat > 1.960
        if output_type == "typst"
            return raw"\*\*"
        else
            return "**"
        end
    elseif t_stat > 1.645
        if output_type == "typst"
            return raw"\*"
        else
            return "*"
        end
    else
        return ""
    end
end

# Generate significance starts
function significant_starts(p_value)
    if p_value < 0.01
        return "***"
    elseif p_value < 0.05
        return "**"
    elseif p_value < 0.1
        return "*"
    else
        return ""
    end
end

# Helper function to add commas as thousands separators
function format_with_commas(n::Int)
    return replace(string(n), r"(?<=[0-9])(?=(?:[0-9]{3})+$)" => ",")
end

# Helper function for formatting floats with commas
function format_with_commas(n::Float64; precision::Int = 3)
    int_part, frac_part = split(string(n), '.')
    formatted_int = replace(int_part, r"(?<=[0-9])(?=(?:[0-9]{3})+$)" => ",")
    return "$formatted_int.$(frac_part[1:precision])"
end

# Helper function to format numbers in millions with "m" suffix
function format_millions(x; digits=1)
    absx = abs(x)
    if absx >= 1_000_000
        return @sprintf("%.*f", digits, x / 1_000_000) * "m"
    else
        return format_with_commas(x)
    end
end
