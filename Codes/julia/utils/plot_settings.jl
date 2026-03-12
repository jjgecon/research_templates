# Updated on: 2025-05-12

## Color Set up
presentation_black = RGBf(0, 0, 0)
presentation_white = RGBf(1, 1, 1)
presentation_grey = RGBf(169/225, 169/225, 169/225)
presentation_red = RGBf(172/225, 68/225, 37/225)
presentation_green = RGBf(79/255, 121/255, 66/255)
presentation_blue = RGBf(15/255, 82/255, 186/255)
presentation_yellow = RGBf(186/255, 137/255, 104/255)
presentation_purple = RGBf(120/255, 81/255, 169/255)
presentation_teal = RGBf(52/255, 152/255, 164/255)
presentation_pink = RGBf(199/255, 94/255, 154/255)
presentation_orange = RGBf(217/255, 123/255, 42/255)

# Main Theme
main_plot_theme = Theme(
    size = (900, 600),
    fontsize = 24,
    fonts = (; regular = "Helvetica"),
    xlabelpadding = 20, ylabelpadding = 20,
)

set_theme!(main_plot_theme)

# Theme for black background
white_no_background_theme = Theme(
    size = (900, 600),
    fontsize = 24,
    fonts = (; regular = "Helvetica"),
    backgroundcolor = :transparent,
    Axis = (
        backgroundcolor = :transparent,
        xlabelcolor = presentation_white, ylabelcolor = presentation_white,
        xticklabelcolor = presentation_white, yticklabelcolor = presentation_white,
        ytickcolor = presentation_white, xtickcolor = presentation_white, 
        leftspinecolor = presentation_white, rightspinecolor = presentation_white,
        bottomspinecolor = presentation_white, topspinecolor = presentation_white,
        ygridcolor = presentation_white, xgridcolor = presentation_white,
    ),
    Legend = (
        backgroundcolor = :transparent,
        labelcolor = presentation_white,
        titlecolor = presentation_white,
        ticklabelcolor = presentation_white,
        tickcolor = presentation_white,
    ),
)

# Create a continuous colormap based on presentation colors
presentation_cmap_all = cgrad([presentation_blue, presentation_green, presentation_yellow, presentation_red,presentation_purple, presentation_teal, presentation_pink, presentation_orange], 256)

# Create a categorical colormap with n colors derived from presentation colors
function presentation_gen_colors(cmap, n=10)
    # Sample evenly spaced indices from the colormap
    indices = round.(Int, range(1, length(cmap), length=n))
    return cmap[indices]
end

# Crate quantile labels
function quant_labels(cut_off_list, range_q = false)
    quant_labels = []
    if range_q
        for i in 1:size(cut_off_list,1)-1
            lower_bound = @sprintf("%.2f", cut_off_list[i])
            upper_bound = @sprintf("%.2f", cut_off_list[i+1])
            push!(quant_labels, lower_bound*"-" *upper_bound)
        end   
    else 
        for i in 1:size(cut_off_list,1)
            lower_bound = @sprintf("%.2f", cut_off_list[i])
            push!(quant_labels, lower_bound)
        end
    end
    return quant_labels
end

# Define a moving average function
function moving_average(data, window_size)
    result = similar(data)
    n = length(data)
    for i in 1:n
        window_start = max(1, i - floor(Int, window_size/2))
        window_end = min(n, i + floor(Int, window_size/2))
        result[i] = mean(data[window_start:window_end])
    end
    return result
end