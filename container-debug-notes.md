# Container Debug Notes

## Failed Container

```bash
docker run --name devops-practical-log-debug devops_practical-app uvicorn backend.missing:app --host 0.0.0.0 --port 8000
```

## Debug Commands

```bash
docker ps -a
docker logs devops-practical-log-debug
docker inspect devops-practical-log-debug
```

## Error

```text
ERROR: Error loading ASGI app. Could not import module "backend.missing".
```

## Root Cause

The container startup command referenced a Python module that does not exist.

Incorrect:

```text
backend.missing:app
```

Correct:

```text
backend.main:app
```

## Proposed Fix

Update the container command to use the correct FastAPI module path:

```bash
uvicorn backend.main:app --host 0.0.0.0 --port 8000
```
