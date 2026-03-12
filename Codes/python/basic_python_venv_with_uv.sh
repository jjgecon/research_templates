


uv init

# ECONGEO
uv add pandas geopandas numba statsmodels sympy seaborn scipy ipykernel ipyparallel ipython ipython_genutils ipywidgets jupyter  matplotlib numpy openpyxl pandas-datareader unidecode urllib3 xlrd shapely rasterio dask dask-geopandas 

# NLP
uv add python-dotenv openai pandas numpy tiktoken tqdm ipykernel ipyparallel ipython ipython_genutils ipywidgets jupyter pydantic google-genai spacy scikit-learn scipy seaborn matplotlib anthropic 

# GENAI
uv add tensorflow scikit-learn pandas numpy tqdm tensorflow[and-cuda] transformers datasets accelerate pydantic ipykernel ipyparallel ipython ipython_genutils ipywidgets jupyter


uv venv --python 3.11

source venv/bin/activate

