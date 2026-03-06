# Admission Atlas — Armenia 2026

**Armenia's first unified, open-data platform for bachelor's degree admissions.**  
*Built entirely with AI assistance in 4 days by a non-programmer domain expert.*

🔗 **Live Demo:** https://animated-crepe-3ba47e.netlify.app/  
📄 **Submitted to:** [Open Data Armenia Contest 2026](https://contest.opendata.am/en/2026)  
🏆 **Primary category:** Dateno.io Special Prize — AI-powered open data & interactive visualization

---

## The Problem

Every year, approximately **40,000–45,000 Armenian high school graduates** face one of the most consequential decisions of their lives — choosing a university and program — with no unified source of information.

Admission data is scattered across:
- 20+ individual university websites with inconsistent formatting
- Ministry of Education PDF publications
- Historical score archives on dimord.am with no unified interface
- Faculty-specific pages that change annually without notice

Students and families spend many of hours manually cross-referencing sources, often making decisions based on incomplete or outdated information. First-generation students and those outside Yerevan are disproportionately affected — they have less access to the informal networks that compensate for this data gap.

**No unified, structured, interactive resource existed. This project builds it.**

---

## What This Project Does

Admission Atlas aggregates, normalizes, and visualizes bachelor admission data from Armenian universities into a single interactive platform. It allows users to:

- **Compare programs** across universities by admission score thresholds
- **Explore trends** in required scores over multiple years
- **Filter by field of study**, university, or score range
- **Understand the full landscape** of Armenian higher education at a glance

---

## How This Was Built — The AI-First Methodology

This project was built **entirely through AI-assisted development over 4 days**, by an expertise in UI/UX Design,  but no programming background.

This is not a limitation — it is the point.

### AI Tools Used

| Tool | Role in the Project |
|---|---|
| **Claude Code** | Primary development — generated the entire interactive visualization interface |
| **ChatGPT** | Data structuring assistance, schema design, content drafting |
| **Gemini** | Cross-referencing and validation of collected data |
| **Perplexity** | Research and source discovery across Armenian university sources |

### What the Author Contributed
- Identified the problem and defined the user need
- Collected and manually verified data across 20+ official sources
- Made all visualization and UX design decisions (prototyped in Figma)
- Defined the data schema and normalization rules
- Directed AI tools through every stage of development
- Validated all outputs against real admissions data

### What AI Contributed
- Generated all front-end code (HTML, CSS, JavaScript)
- Assisted in structuring raw data into a unified schema
- Accelerated iteration on visualization design
- Enabled a non-programmer to ship a working platform in 4 days

> This project demonstrates AI tools enabling domain experts — not just developers — to create meaningful open data infrastructure. The barrier between "person who understands the problem" and "person who can build the solution" has collapsed.

---

## Data Collection & Methodology

### Sources

Data was manually collected and normalized from **more than 20 official sources**:

| Source | Type | Data Extracted |
|---|---|---|
| Armenian university official websites | Web | Programs, faculties, tuition, contacts |
| dimord.am | Web (exam database) | Applicant scores, rankings, thresholds |
| Ministry of Education regulations | PDF / Official | Rules, quota numbers, eligibility criteria |
| Historical score publications | PDF archive | Admission scores 2021–2024 |
| University faculty pages | Web | Program-level details |

### Process

1. **Identification** — Catalogued all bachelor-level programs across accredited Armenian universities
2. **Extraction** — Manually retrieved admission data; many sources published only as PDFs, Words or unstructured HTML, all transcribed and verified
3. **Normalization** — Unified inconsistent field naming, score scales, and program categories across institutions into one schema
4. **Validation** — Cross-referenced data across multiple sources to catch discrepancies
5. **Structuring** — Organized into a unified dataset with consistent fields

### Data Schema

Each record represents one admission program-year:

```
university       — Institution name
faculty          — Faculty or department  
program          — Bachelor's program name
year             — Admission year (2021–2026)
min_score        — Minimum admitted score
max_score        — Maximum admitted score
quota            — Number of state-funded places
tuition_places   — Number of paid places
field            — Normalized field of study category
location         — City
```

---

## Dataset

The structured dataset is available in this repository and free to use:

- [`data/programs.json`](./data/programs.json) — Full dataset in JSON
- [`data/programs.csv`](./data/programs.csv) — Full dataset as CSV (Excel, Python, R compatible)

Published under MIT license for free use, reuse, and redistribution.

---

## Visualization Decisions

Interactive visualizations were chosen over static tables because admission data has a critical **time dimension** — scores shift year to year, and patterns matter as much as individual data points.

Key design choices:
- **Score range charts over multiple years** reveal which programs are becoming more or less competitive
- **Field-of-study filtering** narrows 500+ programs to what's relevant for each user
- **Comparative view** enables side-by-side program comparison — a workflow that previously required opening 10+ browser tabs

---

## Long-Term Vision

While the current version demonstrates core functionality, the long-term vision is to develop Admission Atlas into a **national-level digital infrastructure tool** — one that can be adopted and supported institutionally.

The platform has the potential to serve:
- **Applicants and parents** — making informed, data-driven university decisions
- **Policymakers** — monitoring trends in program demand, regional access disparities, and state-funded quota allocation
- **Researchers** — studying mobility, equity, and outcomes in Armenian higher education
- **Educational institutions** — benchmarking programs within the national landscape
- **Journalists and civil society** — holding the system accountable through data-driven reporting

Greater transparency in Armenia's higher education system benefits everyone. A unified, maintained, open data layer is a prerequisite for that transparency. This project is a first step toward building it.

---

## Limitations & Future Work

- Data for 2026 is partially complete pending official Ministry publication
- Private universities are underrepresented due to inconsistent data publishing
- Mobile experience is planned for improvement
- Future version will include automated data updates each admissions cycle

---

## Project Structure

```
admission-atlas-armenia/
├── index.html          # Main interactive visualization interface
├── data/
│   ├── programs.json   # Structured dataset (JSON)
│   └── programs.csv    # Structured dataset (CSV)
├── README.md           # Project documentation
└── LICENSE             # MIT license
```

---

## Author

**Astghik Petrosyan**  
Built for the [Open Data Armenia Contest 2026](https://contest.opendata.am/en/2026)

---

## License

MIT — free to use, share, and build upon.

---

## Acknowledgements

Data sourced from Armenian university official websites, dimord.am, and the Ministry of Education of the Republic of Armenia. This project is independent and not affiliated with any university or government body.
