Disease Outbreak Analysis and Forecast in Nigeria

Tool: Power BI Desktop
Dataset: Disease case records across Nigeria, sourced from Kaggle
Coverage: 2008–2018, all 36 states plus the Federal Capital Territory (FCT)
Diseases tracked (10): Cholera, Diarrhoea, Ebola, Malaria, Marburg Virus, Measles, Meningitis, Rubella, Viral Haemorrhagic Fever, Yellow Fever

Features

Filters by Disease, State, Report Year, and Age-Group
Geographic map visual plotting outbreak locations across Nigeria
Year-over-year case trend line (2008–2018) with forecasted range beyond the historical period
Age-group breakdown of total cases
KPI cards: Total Cases, Count of States, Count of Diseases

Key Findings

284K total recorded cases across the full dataset
Adults carry the highest case burden by age-group, followed by Youth — a clear signal for where intervention and resource allocation should be prioritised
Annual case totals stayed relatively stable, generally ranging between 28,000–29,000 cases per year across the observed period, with year-to-year fluctuation rather than a clear sustained trend
A forecasted range is shown for years beyond the historical data, using Power BI's built-in forecasting feature

Methodology Note
The forecast shown is generated using Power BI's native forecasting feature, which applies exponential smoothing to historical trends. This is a built-in extrapolation tool, not a custom-trained predictive model, and should be read as a first-pass projection rather than an epidemiological model.

Files in This Folder

nigeria_disease_outbreak.pbix — full Power BI file
screenshots/ — dashboard views for quick preview without opening Power BI

Limitations

Dataset sourced from Kaggle; original data collection methodology is not independently verified
"Total Cases" KPI and the annual trend chart should be read independently — the KPI reflects the full dataset total, while the trend chart shows year-by-year breakdowns including the forecasted range
