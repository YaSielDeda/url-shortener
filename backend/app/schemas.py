from pydantic import BaseModel

class LinkIn(BaseModel):
    original_url: str

class LinkOut(BaseModel):
    original_url: str
    short_id: str

    class Config:
        orm_mode = True