# DevOps Practical Examination

This repository contains the work completed for the DevOps practical examination.

## Project Structure

- `frontend/index.html`: A simple HTML web page containing a heading, paragraph, repository link, and button.
- `backend/main.py`: FastAPI backend application.
- `backend/requirements.txt`: Python dependencies for the backend.
- `Dockerfile`: Container image definition for the application.

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
Initial commit: added index.html page
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

### Commit Messages Used

```bash
Update heading from first conflict branch
Update heading from second conflict branch
Resolve homepage heading merge conflict
Document merge conflict resolution steps
```

### Proof Screenshot

![Merge conflict proof](screenshoot/merge-conflict-proof.png)

### Explanation

The conflict happened because two branches changed the same line in `index.html`. Git could not decide which change to keep, so I manually edited the file, removed the conflict markers, kept the correct final heading, staged the file, and committed the merge conflict resolution.

## Question 4: Write a Dockerfile for an Application with Optimization and Small Image Size

### Files Created

- `backend/main.py`: Simple FastAPI application that serves `frontend/index.html`.
- `backend/requirements.txt`: Contains Python dependencies.
- `frontend/index.html`: Static frontend page served by FastAPI.
- `Dockerfile`: Builds the application container image.
- `.dockerignore`: Removes unnecessary files from the Docker build context.

### Dockerfile

```dockerfile
FROM python:3.12-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

RUN adduser --disabled-password --gecos "" --no-create-home appuser

COPY backend/requirements.txt .
RUN pip install -r requirements.txt

COPY --chown=appuser:appuser backend ./backend
COPY --chown=appuser:appuser frontend ./frontend

USER appuser

EXPOSE 8000

CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

### Commands Used

```bash
docker build -t devops-practical-app .
docker run -p 8000:8000 devops-practical-app
```

### Optimization Steps

- Used `python:3.12-slim`, which is smaller than a full Python image.
- Copied only required files into the image.
- Used `.dockerignore` to exclude Git files, screenshots, logs, environment files, and dependencies.
- Set `PIP_NO_CACHE_DIR=1` to avoid storing pip cache in the image.
- Set `PIP_DISABLE_PIP_VERSION_CHECK=1` to reduce unnecessary pip output and checks.
- Set Python environment variables to avoid `.pyc` files and improve container logging.
- Created and used a non-root `appuser` for better container security.
- Used `--no-create-home` to avoid creating an unnecessary home directory for the container user.
- Used `COPY --chown=appuser:appuser` so files are owned by the non-root user.

### Proof Screenshots

Docker image build completed successfully:

<img src="screenshoot/docker-build-success.png" alt="Docker build success" width="600">

Docker container running successfully:

<img src="screenshoot/docker-container-running.png" alt="Docker container running" width="600">

### Explanation

The Dockerfile creates a lightweight image for the FastAPI application. The app serves the static `frontend/index.html` page through `backend/main.py` on port `8000` and provides a `/health` endpoint for container checks. The image is optimized by using a slim Python base image, excluding unnecessary files, installing dependencies without cache, and running the application as a non-root user.
