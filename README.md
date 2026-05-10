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

git checkout -b feature/update-homepage
git add .
git commit -m "Update homepage content"

git checkout develop
git merge feature/update-homepage

git checkout main
git merge develop

git push origin main
git push origin develop
git push origin feature/update-homepage
```

### Explanation

First, I created a `develop` branch from `main`. Then I created a feature branch named `feature/update-homepage` from `develop` to simulate a developer working on a new feature. After completing the work, I committed the changes and merged the feature branch into `develop`. Finally, I merged `develop` into `main` to simulate releasing stable code.

## Question 3: Resolve a Merge Conflict Scenario and Document the Steps Taken

### Scenario

A merge conflict was created by editing the same heading line in `index.html` on two different branches:

- `conflict-change-a`
- `conflict-change-b`

### Commands Used

```bash
git checkout -b conflict-change-a
git add index.html
git commit -m "Update heading from first conflict branch"

git checkout main
git checkout -b conflict-change-b
git add index.html
git commit -m "Update heading from second conflict branch"

git checkout main
git merge conflict-change-a
git merge conflict-change-b
```

The second merge created a conflict in `index.html`.

### Conflict Resolution Steps

```bash
git status
```

I opened `index.html`, removed the conflict markers, and kept the final correct heading:

```html
<h1>Welcome to My DevOps Practical Website</h1>
```

Then I added and committed the resolved file:

```bash
git add index.html
git commit -m "Resolve homepage heading merge conflict"
```

### Explanation

The conflict happened because two branches changed the same line in `index.html`. Git could not decide which change to keep, so I manually edited the file, removed the conflict markers, kept the correct final heading, staged the file, and committed the merge conflict resolution.
