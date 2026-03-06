# Admission Atlas — Armenia 2026

**Armenia's first unified, open-data platform for bachelor's degree admissions.**

🔗 **Live Demo:** https://animated-crepe-3ba47e.netlify.app/

---

## The Problem

Every year, approximately **40,000–45,000 Armenian high school graduates** go through the bachelor's admissions process — one of the most consequential decisions of their lives.

Yet the data they need to make informed choices is scattered across:
- 20+ individual university websites with inconsistent formatting
- Ministry of Education PDF publications
- Historical score archives on dimord.am with no unified interface
- Faculty-specific pages that change annually without notice

The result: students and families spend dozens of hours manually cross-referencing sources, often making decisions based on incomplete or outdated information. First-generation students, and those outside Yerevan, are disproportionately affected — they have less access to informal networks that compensate for this information gap.

**No unified, structured, interactive resource existed. This project builds it.**

---

## What This Project Does

Admission Atlas aggregates, normalizes, and visualizes bachelor admission data from Armenian universities into a single interactive interface. It allows users to:

- **Compare programs** across universities by admission score thresholds
- **Explore trends** in required scores over multiple years
- **Filter by field of study**, university, or score range
- **Understand the landscape** of Armenian higher education at a glance

---

## Data Collection & Methodology

### Sources
Data was manually collected and normalized from **more than 20 official sources**, including:

| Source | Type | Data Extracted |
|---|---|---|
| Armenian university official websites | Web | Programs, faculties, tuition, contacts |
| dimord.am | Web (exam database) | Applicant scores, rankings, thresholds |
| Ministry of Education admission regulations | PDF/Official | Rules, quota numbers, eligibility criteria |
| Historical score publications | PDF archive | Admission scores 2021–2024 |
| University faculty pages | Web | Program-level details |

### Data Collection Process

1. **Identification** — Catalogued all bachelor-level programs across accredited Armenian universities.
2. **Extraction** — Manually retrieved admission data from each source. Many sources published data only as PDFs or unstructured HTML tables; all were manually transcribed and verified.
3. **Normalization** — Unified inconsistent field naming, score scales, and program categorizations across institutions into a single schema.
4. **Validation** — Cross-referenced data across multiple sources where possible to catch discrepancies.
5. **Structuring** — Organized into a unified dataset with consistent fields: university, faculty, program, year, minimum score, maximum score, quota, tuition status.

### Data Schema

Each record in the dataset represents one admission program-year and contains:

```
university       — Institution name (Armenian and transliterated)
faculty          — Faculty or department
program          — Bachelor's program name
year             — Admission year (2021–2026)
min_score        — Minimum admitted score
max_score        — Maximum admitted score (top applicant)
quota            — Number of state-funded places
tuition_places   — Number of paid places
field            — Broad field of study (normalized category)
location         — City
```

---

## Visualization Decisions

The platform uses interactive visualizations rather than static tables because admission data has a critical time dimension — scores shift year to year, and patterns matter as much as individual data points.

Key design choices:
- **Score range charts** over multiple years reveal which programs are becoming more or less competitive
- **Filtering by field** lets users meaningfully narrow from 500+ programs to relevant options
- **Comparative view** allows side-by-side program comparison — a workflow that previously required opening 10+ browser tabs

---

## Why This Matters for Open Data in Armenia

This project demonstrates that valuable open data doesn't only come from government APIs or sensors — it can be liberated from fragmented, hard-to-use official sources through systematic collection and structuring.

The dataset built for this project is itself a public good. By publishing it openly under MIT license, we enable:
- Researchers to analyze trends in Armenian higher education
- Journalists to report on shifts in program competitiveness
- Future developers to build on top of this foundation
- Policymakers to see which programs attract applicants and which struggle

---

## Technical Implementation

- **Frontend:** Single-page interactive application (HTML/CSS/JavaScript)
- **Visualization:** Chart.js / D3-based interactive components
- **Data format:** Structured JSON embedded and available as standalone CSV
- **Design & Prototyping:** Figma
- **Deployment:** Netlify (continuous deployment from GitHub)
- **AI Tools Used:** Claude Code, ChatGPT, Gemini, Perplexity (for development assistance and research)

> Note on AI tools: AI assistants were used to accelerate development. All data collection, normalization, validation, and visualization design decisions were made by the author. The dataset itself — the core value of this project — was built through manual research across 20+ sources.

---

## Dataset

The structured dataset is available in this repository:

- [`data/programs.json`](./data/programs.json) — Full dataset in JSON format
- [`data/programs.csv`](./data/programs.csv) — Same dataset as CSV for easy use in Excel, Python, R, etc.

The dataset covers **Armenian bachelor admission programs for 2021–2026** and is published under the MIT license for free use, reuse, and redistribution.

---

## Project Structure

```
admission-atlas-armenia/
├── index.html          # Main interactive visualization interface
├── data/
│   ├── programs.json   # Full structured dataset (JSON)
│   └── programs.csv    # Full structured dataset (CSV)
├── README.md           # This document
└── LICENSE             # MIT open-source license
```

---

## Limitations & Future Work

- Data for 2026 is partially complete pending official Ministry publication
- Private universities are underrepresented due to less consistent data publishing
- Mobile experience could be improved
- A planned future version will include real-time scraping so the dataset updates automatically each admissions cycle

---

## Author

**Astghik Petrosyan**
Built for the [Open Data Armenia Contest 2026](https://contest.opendata.am/en/2026)

---

## License

MIT — free to use, share, and build upon.

---

## Acknowledgements

Data sourced from Armenian university official websites, dimord.am, Ministry of Education of the Republic of Armenia, and historical admission publications. This project is independent and not affiliated with any university or government body.
