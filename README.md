# Data-Work

## Project Description
This repository contains exploratory data analysis and SQL-based insights for a dataset derived from a public source. The work is organized around a Jupyter/Colab notebook that performs data cleaning, exploratory visualizations, and SQLite queries to validate key metrics. The goal is to provide a clear, reproducible workflow that can be extended into interactive dashboards.

## Dataset Source
- **Origin:** Publicly available dataset downloaded from an open data portal.
- **Format:** Tabular CSV (UTF-8) with accompanying metadata.
- **Storage:** Raw files should be placed in `data/raw/`; cleaned outputs are written to `data/processed/`.

## Running the Notebook in Google Colab
1. Open the notebook from this repository in Google Colab (`File > Open notebook > GitHub` and paste the repo URL).
2. In a new cell, clone the repo and navigate into it:
   ```bash
   !git clone https://github.com/<your-username>/Data-Work.git
   %cd Data-Work
   ```
3. Install dependencies (add more as needed for visuals):
   ```bash
   !pip install pandas numpy matplotlib seaborn sqlalchemy sqlite-utils
   ```
4. Upload the raw CSV to the Colab runtime or mount Google Drive, then move the file to `data/raw/`.
5. Run the notebook cells in order; outputs and intermediate artifacts will be saved under `data/processed/`.

## Data Cleaning & EDA Summary
- **Schema validation:** Check column names, dtypes, and missing values; coerce dates and numeric fields.
- **Quality checks:** Remove duplicate rows, trim string whitespace, standardize categorical labels, and handle nulls via imputation or filtering as appropriate.
- **Feature engineering:** Derive helper columns (e.g., year, month, normalized rates) to simplify analysis.
- **Exploratory visuals:** Use histogram, box plot, and time-series line plots to inspect distributions and trends; calculate descriptive statistics to flag outliers.

## SQL Analysis (SQLite)
- The notebook creates a local SQLite database in `data/processed/analysis.db` using `sqlite3` or SQLAlchemy.
- Key queries include aggregations (SUM/AVG/COUNT), window functions for rankings, and joins across lookup tables when available.
- Example workflow:
  1. Load cleaned DataFrame and persist to SQLite via `to_sql`.
  2. Execute parameterized queries to compute KPIs and pivot-style summaries.
  3. Export query results to CSV for visualization or downstream tools.

## Expected Folder Structure
```
Data-Work/
├─ data/
│  ├─ raw/          # original CSVs and metadata
│  └─ processed/    # cleaned CSVs, SQLite DBs, derived exports
├─ notebooks/       # primary analysis notebooks
├─ reports/         # EDA summaries, charts, or markdown reports
└─ README.md
```

## Extending with a Tableau Dashboard
- Export SQLite query outputs or processed CSVs to `reports/` for easy ingestion.
- Use Tableau's native SQLite connector or connect to the CSV extracts to build visuals that mirror the notebook KPIs.
- Keep the notebook as the single source of truth for data prep; publish updated extracts whenever the dataset refreshes.
- Consider adding a `tableau/` subfolder for packaged workbooks and data source definitions.
