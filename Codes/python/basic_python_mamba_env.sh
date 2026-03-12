#!/bin/bash
mamba create --name econ_geo python=3.11 pandas geopandas numba statsmodels sympy seaborn scipy ipykernel ipyparallel ipython ipython_genutils ipywidgets jupyter  matplotlib numpy openpyxl pandas-datareader unidecode urllib3 xlrd
pip install -U shapely rasterio dask dask-geopandas 