import matplotlib.pyplot as plt
import matplotlib.colors as mcolors
import numpy as np

# ==========================================
# 1. Color Set up
# ==========================================
presentation_black  = (0.0, 0.0, 0.0)
presentation_white  = (1.0, 1.0, 1.0)
presentation_grey   = (169/255, 169/255, 169/255)
presentation_red    = (172/255, 68/255, 37/255)
presentation_green  = (79/255, 121/255, 66/255)
presentation_blue   = (15/255, 82/255, 186/255)
presentation_yellow = (186/255, 137/255, 104/255)
presentation_purple = (120/255, 81/255, 169/255)
presentation_teal   = (52/255, 152/255, 164/255)
presentation_pink   = (199/255, 94/255, 154/255)
presentation_orange = (217/255, 123/255, 42/255)

# ==========================================
# 1. Makie-Style Theme Settings
# ==========================================
makie_style_theme = {
    # Figure and Axes
    'figure.figsize': (9, 6),
    'figure.facecolor': 'white',
    'axes.facecolor': 'white',
    
    # Spines (The bounding box)
    'axes.edgecolor': 'black',
    'axes.linewidth': 0.8,
    'axes.spines.top': True,
    'axes.spines.right': True,
    
    # Grid
    'axes.grid': True,
    'axes.axisbelow': True,        # Ensure grid is behind the points
    'grid.color': '#E5E5E5',       # Very light grey
    'grid.linewidth': 0.8,
    'grid.linestyle': '-',
    
    # Typography (Mimicking the academic/LaTeX look)
    'font.family': 'sans-serif',
    'font.sans-serif': ['Helvetica', 'Arial', 'DejaVu Sans'],
    'mathtext.fontset': 'dejavusans',      # DejaVu Sans for math symbols
    'font.size': 20,
    'axes.labelsize': 18,
    'axes.labelpad': 12.0,
    
    # Ticks
    'xtick.labelsize': 18,
    'ytick.labelsize': 18,
    'xtick.major.size': 5,         # Length of tick marks
    'ytick.major.size': 5,
    'xtick.direction': 'out',
    'ytick.direction': 'out',
}

# Apply the theme
plt.rcParams.update(makie_style_theme)

# Theme for black background
white_no_background_theme = {
    **makie_style_theme,                    # Inherit base settings
    'figure.facecolor': 'none',           # Transparent background
    'axes.facecolor': 'none',
    'savefig.facecolor': 'none',          # Transparent on save
    'text.color': presentation_white,
    'axes.labelcolor': presentation_white,
    'axes.edgecolor': presentation_white, # Spines
    'xtick.color': presentation_white,
    'ytick.color': presentation_white,
    'grid.color': presentation_white,
    'legend.facecolor': 'none',           # Transparent legend background
    'legend.edgecolor': 'none',
    'legend.labelcolor': presentation_white,
}

# Helper functions to switch themes easily
def set_main_theme():
    plt.rcParams.update(plt.rcParamsDefault)
    plt.rcParams.update(makie_style_theme)

def set_white_no_bg_theme():
    plt.rcParams.update(white_no_background_theme)

# ==========================================
# 3. Colormaps
# ==========================================
# Create a continuous colormap
color_list = [
    presentation_blue, presentation_green, presentation_yellow, 
    presentation_red, presentation_purple, presentation_teal, 
    presentation_pink, presentation_orange
]
presentation_cmap_all = mcolors.LinearSegmentedColormap.from_list(
    'presentation_cmap', color_list, N=256
)

# Create a categorical colormap
def presentation_gen_colors(cmap, n=10):
    """Samples evenly spaced indices from the colormap."""
    return [cmap(i) for i in np.linspace(0, 1, n)]

# ==========================================
# 4. Utility Functions
# ==========================================
def quant_labels(cut_off_list, range_q=False):
    """Creates quantile string labels."""
    labels = []
    if range_q:
        for i in range(len(cut_off_list) - 1):
            lower_bound = f"{cut_off_list[i]:.2f}"
            upper_bound = f"{cut_off_list[i+1]:.2f}"
            labels.append(f"{lower_bound}-{upper_bound}")
    else:
        for val in cut_off_list:
            labels.append(f"{val:.2f}")
    return labels

def moving_average(data, window_size):
    """
    Computes a centered moving average. Shrinks the window at the edges 
    to match the exact logic of the Julia implementation.
    """
    data = np.asarray(data)
    result = np.empty_like(data, dtype=float)
    n = len(data)
    half_window = window_size // 2
    
    for i in range(n):
        # Python uses 0-based indexing. Max/min bounds ensure we don't index out of bounds.
        window_start = max(0, i - half_window)
        window_end = min(n, i + half_window + 1) # +1 because Python slicing is exclusive
        result[i] = np.mean(data[window_start:window_end])
        
    return result