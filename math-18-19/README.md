# MATH 18/19

This was the result of an undergraduate project in the School of Mathematics at the University of Edinburgh, during the 2018/19 academic year.

The folder contains the data and code needed to reproduce the figures in this paper:

> Kinnear, G., Bennett, M., Binnie, R., Bolt, R. and Zheng, Y. (2020). “Reliable application of the MATH taxonomy sheds light on assessment practices”. In: Teaching Mathematics and its Applications: An International Journal of the IMA. hrz017 URL: https://doi.org/10.1093/teamat/hrz017

## Data

### data_math_1819.csv
This contains all the coding done throughout the project.

| Column(s) | Description |
| :------------- | :------------- |
| Course / Year / Paper / Question | identify the source of the item |
| Marks | the number of marks allocated to the item |
| Rater | the name of the coder who decided the categorisation |
| MATH | the code from the MATH taxonomy allocated to the item (NB, these are named A1/A2/A3 etc where A1 = FKFS, A2 = COMP, etc) |
| Notes | comments left by the coder with further detail about their choice (NB, these often refer to roman numerals which appear in a separate coding manual shared between the coders, but not publically available) |
| PRAC-A / PRAC-C / PRAC-Prop | the proportion of algorthmic and creative marks, following Gilbey, J., & Robson, D. (2018). The PRAC Taxonomy for Formal Mathematical Assessments. In S. Pope (Ed.), Informal Proceedings of the 9th British Congress of Mathematics Education 2018 (pp. 55–58).|

### data_irr.csv

| Column(s) | Description |
| :------------- | :------------- |
| Phase | the phase of coding -- see Fig 1 in Kinnear et al. (2020) for a description of these |
| Course / Assessment / Question | identify the source of the item |
| Marks | the number of marks allocated to the item |
| Rater 1/2/3/4 | the MATH code allocated by each of the four raters (in some cases, not all raters rated the items -- these entries are blank) |
| Agreed | the finally agreed MATH code |

## Code

The analysis code is split across three notebooks:

### [analysis_01_overall.Rmd](analysis_01_overall.Rmd) ([rendered PDF](analysis_01_overall.pdf))
Main analysis and visualisation of the MATH taxonomy content of each type of exam in the sample. This includes some statistical comparisons between school and university exams.

### [analysis_02_comparing-secondary.Rmd](analysis_02_comparing-secondary.Rmd) ([rendered PDF](analysis_02_comparing-secondary.pdf))
Further analysis within the set of school exams only.

### [analysis_03_ila.Rmd](analysis_03_ila.Rmd) ([rendered PDF](analysis_03_ila.pdf))
Further analysis with in the university course, ILA. This combines the data on exams (from `data_math_1819.csv`) with the data on coursework (the agreed codes from `data_irr.csv`).
