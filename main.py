from pathlib import Path

from fastapi import FastAPI
from fastapi.responses import FileResponse, JSONResponse

app = FastAPI(title="DevOps Practical App")

BASE_DIR = Path(__file__).resolve().parent
INDEX_FILE = BASE_DIR / "index.html"


@app.get("/")
def home():
    if not INDEX_FILE.exists():
        return JSONResponse(
            status_code=500,
            content={"error": "index.html file not found"},
        )

    return FileResponse(INDEX_FILE)


@app.get("/health")
def health():
    return {"status": "ok"}
