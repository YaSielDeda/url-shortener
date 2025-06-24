from fastapi import FastAPI, HTTPException, Depends, Request
from starlette.responses import RedirectResponse
from sqlalchemy.orm import Session
from . import models, schemas, database, utils

app = FastAPI()
models.Base.metadata.create_all(bind=database.engine)

@app.post("/shorten", response_model=schemas.LinkOut)
def create_short_link(link: schemas.LinkIn, db: Session = Depends(database.get_db)):
    short_id = utils.generate_short_id()
    db_link = models.Link(original_url=link.original_url, short_id=short_id)
    db.add(db_link)
    db.commit()
    db.refresh(db_link)
    return db_link

@app.get("/{short_id}")
def redirect(short_id: str, db: Session = Depends(database.get_db)):
    link = db.query(models.Link).filter_by(short_id=short_id).first()
    if not link:
        raise HTTPException(status_code=404, detail="Short link not found")
    return RedirectResponse(link.original_url)