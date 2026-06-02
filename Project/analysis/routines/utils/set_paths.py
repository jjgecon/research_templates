from pathlib import Path
import platform

if platform.system() == "Linux":
    data_dir = "data_hpc"
else:  # Assume macOS or other
    data_dir = "data"

path_raw = Path(f"../{data_dir}/raw/")
path_models = Path(f"../{data_dir}/llm_models/")
path_validation = Path("../validation/")
path_content = Path("../validation/content/")
path_temp = Path("../temp/")
path_routine = Path("../processing_routines/")
path_batch_files = path_routine / "batches"
