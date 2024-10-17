# Using LLMs for Syntactic Research
## Overview
This repository includes the scripts used to reproduce Experiment 2 from Salzmann et al. (2022) with GPT 3.5 Turbo and/or GPT 4. The original items and data belong to Salzmann et al. (2022) and were excluded in this repository. To query GPT 3.5 Turbo `api_call_judgment.ipynb` can be used. The results from the queries are saved to `/results`. The generalized linear mixed models for statistic inference can be realized with `reproduction_exp2.R` in `/data`. The scripts `load_human_results.ipynb` and `load_llm_results.ipynb` will help with analyzing the results.

## Packages
Necessary python packages can be installed with:

> poetry install

Nececssary R packages can be installed with the provided R file.

## Discussion

For a discussion of this project and their results, please consider: [Using LLMs for Syntactic Research](https://omseeth.github.io/blog/2024/llms_syntactic_research/) (Seeth 2024)