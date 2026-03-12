from pathlib import Path
import platform

if platform.system() == "Linux":
    data_dir = "data_hpc"
else:  # Assume macOS or other
    data_dir = "data"

# the working directory should be in main directory

path_processed = Path("processed_data/")
path_raw_data = Path(f"{data_dir}/raw/")
path_geo = Path(f"{data_dir}/geometries/")
path_figures = Path("tables_figures/")
path_routines = Path("routines/")
