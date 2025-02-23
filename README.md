# Qualitas.git Corpus (2025 Edition)

## Introduction

The **Qualitas.git Corpus** (2025 Edition) is an updated version of the original Qualitas Corpus, designed to provide a curated collection of open-source software repositories in their Git-based versions. This project aims to facilitate empirical studies in **software engineering, program analysis, and software evolution** by offering an up-to-date and structured dataset of real-world software projects.

## Objectives

- Provide an **updated** and **maintainable** version of the Qualitas Corpus.
- Enable researchers and practitioners to study **software evolution, quality, and reliability** using modern Git-based repositories.
- Support reproducibility in **software engineering research** by maintaining historical and recent versions of software projects.

## Structure

The corpus consists of repositories cloned from publicly available sources, ensuring:
- **Authenticity**: Original repository structures and commit histories are preserved.
- **Diversity**: Includes various software domains (e.g., development tools, frameworks, utilities).
- **Accessibility**: Available as Git repositories for easy cloning, analysis, and experimentation.

For more details, visit the official documentation or check the list of included projects.

## Repository Download Scripts for Qualitas.git Corpus

### Overview

This repository includes two shell scripts, `download_repos1.sh` and `download_repos2.sh`, which automate the cloning of Git repositories for the **Qualitas.git Corpus (2025 Edition)**.  

- **`download_repos1.sh`**: Clones projects from the original **Qualitas Corpus** that are available on GitHub.  
- **`download_repos2.sh`**: Clones additional **relevant Java ecosystem projects** that complement the original corpus.  

### Usage

Ensure Git is installed and run the scripts:

```bash
./download_repos1.sh
./download_repos2.sh
```

## extract_logs.sh - Log Extraction and Line Counting Script

### Overview

The `extract_logs.sh` script is designed to extract detailed information from cloned repositories in the `repos` directory, generating commit logs and file line counts for each repository. It processes each Git repository, saving the results in log and CSV files.

### Objective

This script performs the following tasks for each Git repository:

- Generates a formatted commit log.
- Counts the number of lines in each file in the repository.
- Saves the information in separate files, organized by repository.

### How It Works

1. **Generating Commit Logs**:
   - For each repository, the script generates a log file with the commit hash, author, date, and message for each commit.
   - **Command Used**:
     ```bash
     git log --pretty=format:'[%h] %aN %ad %s' --date=iso8601 --numstat
     ```
     - `--pretty=format:'[%h] %aN %ad %s'`: Formats the log output to show the commit hash (`%h`), author name (`%aN`), author date (`%ad`), and commit message (`%s`).
     - `--date=iso8601`: Specifies the date format as ISO 8601.
     - `--numstat`: Includes the number of added and deleted lines in each commit.

2. **Counting Lines in Files**:
   - The script counts the number of lines in each file in the repository and saves it in a CSV file.
   - **Command Used**:
     ```bash
     git ls-files | xargs wc -l
     ```
     - `git ls-files`: Lists all the files in the repository that are being tracked by Git.
     - `xargs wc -l`: For each file, it runs the `wc -l` command to count the number of lines.

### Usage

Ensure Git is installed and run the scripts:

```bash
./extract_logs.sh 
```

## run_analysis.sh - Code Maat Metrics Extraction Script

### Overview

The `run_analysis.sh` script automates the process of running the `code-maat-1.0.4-standalone.jar` program to extract several key software metrics from the repositories in the `logs` directory. The script processes each Git repository and calculates various metrics to provide insights into software evolution and team activity.

### What is Code Maat?

**Code Maat** is a software metrics tool designed to analyze version-controlled software repositories (such as Git). It focuses on extracting information about software evolution, including the dynamics of code changes, contributions, and other project characteristics. The tool calculates a variety of metrics related to the project's codebase, team interactions, and development practices. Code Maat is useful for understanding the long-term health of a software project and identifying potential areas of improvement in both the code and team collaboration.


### How It Works

1. **Running Code Maat**:
   - The script runs the `code-maat-1.0.4-standalone.jar` program with the following metrics:
   - **Command Used**:
     ```bash
     java -jar code-maat-1.0.4-standalone.jar -m <metric> -i <input_dir> -o <output_dir>
     ```

### Metrics Extracted

The script calculates the following metrics:

- **`abs-churn`**: Measures the absolute code churn (the total number of lines added and deleted) in a repository, indicating how actively the code is being modified.
- **`age`**: The age of the project, representing the time since the first commit.
- **`author-churn`**: Tracks the number of lines added and removed by each author, showing how active each contributor is over time.
- **`authors`**: Counts the number of unique authors in the repository, providing an overview of the team's size.
- **`communication`**: Measures the interaction between different authors, identifying how much collaboration is happening across different parts of the codebase.
- **`coupling`**: Analyzes the coupling between classes or modules in the project, helping identify areas with high dependencies.
- **`entity-churn`**: Similar to `abs-churn`, but focused on the churn of entities (e.g., methods, classes) in the project, indicating where changes are concentrated.
- **`entity-effort`**: Measures the effort spent on modifying entities in the codebase, which can provide insights into which parts of the code are most costly to maintain.
- **`entity-ownership`**: Tracks which entities are primarily owned by each developer, providing an overview of responsibility distribution across the project.
- **`fragmentation`**: Measures the fragmentation of the codebase, which can indicate poor modularity or high complexity.
- **`identity`**: Identifies the stability of the project's identity by tracking the degree of code duplication and refactoring.
- **`main-dev`**: Identifies the main developer(s) of the project, based on the volume of changes committed over time.
- **`main-dev-by-revs`**: Similar to `main-dev`, but focused on the number of revisions contributed by the main developer.
- **`refactoring-main-dev`**: Tracks refactoring activities performed by the main developer, providing insights into maintenance activities.
- **`revisions`**: Counts the total number of commits (revisions) in the repository, showing the project's development activity over time.
- **`soc`**: Measures the social aspect of development by analyzing how many authors interact with each other through commits.
- **`summary`**: A summary of the repository's evolution, containing key metrics and general project insights.

### Usage

To run the analysis, use the following command:

```bash
./run_analysis.sh      
```

## classification.ipynb - Commit Classification Using FastText

### Overview

The `classification.ipynb` notebook trains a machine learning model using **FastText** to classify commit messages into predefined categories. This helps in analyzing software evolution by distinguishing different types of code changes.

### Model Training and Evaluation

The model is trained on a labeled dataset of commit messages and validated using a separate test set. Its performance is measured using **Precision, Recall, and F1-score**, where the overall metrics are:

- **Precision**: 0.81  
- **Recall**: 0.81  
- **F1-score**: 0.81  

### Commit Categories

The model classifies commits into five categories:

- **Corrective**: Bug fixes and defect corrections.
- **Features**: New functionalities and enhancements.
- **Non-functional**: Performance, security, or documentation improvements.
- **Perfective**: Code refactoring and maintainability updates.
- **Unknown**: Unclassified or ambiguous commits.

### Usage

The `classification.ipynb` notebook can be used to **train, evaluate, and apply the model** for commit classification. It allows researchers to fine-tune the model using different training datasets and parameters, facilitating software maintenance and evolution analysis.


## Generating a Treemap of the Logical Architecture

### Overview

The Jupyter Notebook `run_files_maps.ipynb` processes the `all_files.csv` file from the **logs** directory and generates a **treemap** representing the logical architecture of the software repositories. This visualization helps analyze the **folder structure and file sizes**, allowing for an intuitive understanding of the repository's composition.

### Purpose

The treemap provides a **hierarchical view** of the repository structure, where:
- **Folders** are represented as nested rectangles.
- **File sizes** determine the relative area of each rectangle.
- This visualization can be used to **assess file distributions, detect anomalies, or analyze architectural trends** in the repository.

## Commit Parsing and Classification

### Overview

`run_parser_commits.ipynb` processes Git logs to extract **commit metadata, file changes, and classify commit types** using a FastText model. The output is structured CSV files for further analysis.

### Process

1. **Parse Git Logs**: Extracts commit and file change information.
2. **Classify Commits**: Uses a FastText model to categorize commit messages.
3. **Transform Data**: Converts dates to UTC format and sorts commits chronologically.
4. **Save as CSV**: Outputs two datasets:
   - `commits/{task_id}-commits.csv`
   - `commits/{task_id}-files.csv`

### Data Structure

#### `commits.csv`
| Column      | Description             |
|------------|-------------------------|
| commit_id  | Unique commit identifier |
| author     | Commit author's name     |
| date       | Timestamp in UTC         |
| message    | Commit message text      |
| change_type | Predicted commit type  |

#### `files.csv`
| Column     | Description              |
|------------|--------------------------|
| commit_id  | Associated commit ID      |
| added      | Lines added               |
| deleted    | Lines removed             |
| filepath   | Full file path            |
| filename   | Extracted file name       |
