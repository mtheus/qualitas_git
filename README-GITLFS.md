# Git Large File Storage (Git LFS)

## Introduction

Git Large File Storage (Git LFS) is an extension for Git that helps manage large files efficiently by storing them separately from the repository while keeping lightweight references in Git. This prevents performance issues caused by large binary files in the repository history.

## Installation

Before using Git LFS, you need to install it on your system.

### Linux (Ubuntu/Debian)

```bash
sudo apt update
sudo apt install git-lfs
```

### Linux (Fedora)

```bash
sudo dnf install git-lfs
```

### macOS (Homebrew)

```bash
brew install git-lfs
```

### Windows

1. Download the installer from [Git LFS official website](https://git-lfs.github.com/).
2. Run the installer and follow the instructions.

After installation, initialize Git LFS:

```bash
git lfs install
```

## How to Use Git LFS

### Step 1: Track Large Files

To track a specific file type (e.g., `.csv` files), run:

```bash
git lfs track "*.csv"
```

This creates a `.gitattributes` file in the repository with LFS tracking rules.

### Step 2: Add and Commit Files

Once tracking is set up, add and commit the files normally:

```bash
git add .gitattributes
```

```bash
git add largefile.csv
```

```bash
git commit -m "Added large files with Git LFS"
```

### Step 3: Push to Remote Repository

Push the changes to the remote repository as usual:

```bash
git push origin main
```

## Cloning a Repository with Git LFS

When cloning a repository that uses Git LFS, ensure that LFS objects are fetched properly:

```bash
git lfs clone <repository_url>
```

Alternatively, after a standard clone, run:

```bash
git lfs pull
```

## Removing Large Files from Git History

If large files have already been committed without LFS and need removal:

1. Use `git lfs migrate` to rewrite history:
   ```bash
   git lfs migrate import --include="*.csv"
   ```
2. Force push the changes:
   ```bash
   git push --force
   ```

## Benefits of Git LFS

- Reduces repository size by storing large files separately.
- Improves cloning and fetching speeds.
- Efficient versioning of binary files.

For more information, visit the [Git LFS documentation](https://git-lfs.github.com/).
