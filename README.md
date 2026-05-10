# DevOps Practical Examination

This repository contains the work completed for the DevOps practical examination.

## Project File

- `index.html`: A simple HTML web page containing a heading, paragraph, list, link, and button.

## Question 1: Initialize a Git Repository and Push Code to GitHub

### Commands Used

```bash
git init
git add .
git commit -m "Initial commit: add index.html page"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
git push -u origin main
```

### Explanation

First, I initialized a Git repository using `git init`. Then I added all project files using `git add .` and committed them with a proper commit message. After that, I renamed the branch to `main`, connected the local repository to GitHub using `git remote add origin`, and pushed the code to GitHub using `git push -u origin main`.

### Example Commit Message

```bash
Initial commit: add index.html page
```

## Question 2: Create a Branching Strategy and Simulate Team Workflow

### Branching Strategy

- `main`: Stable production branch.
- `develop`: Integration branch where completed features are merged.
- `feature`: Branch used by a developer to work on a new feature.

### Commands Used

```bash
git branch develop
git checkout develop

git checkout -b feature/add-html-page
git add .
git commit -m "Add simple HTML page"

git checkout develop
git merge feature/add-html-page

git checkout main
git merge develop

git push origin main
git push origin develop
git push origin feature/add-html-page
```

### Explanation

First, I created a `develop` branch from `main`. Then I created a feature branch named `feature/add-html-page` from `develop` to simulate a developer working on a new feature. After completing the work, I committed the changes and merged the feature branch into `develop`. Finally, I merged `develop` into `main` to simulate releasing stable code.
