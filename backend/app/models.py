from sqlalchemy import Column, Integer, String
from .database import Base

class Link(Base):
    __tablename__ = "links"

    id = Column(Integer, primary_key=True, index=True)
    original_url = Column(String, nullable=False)
    short_id = Column(String(10), unique=True, index=True, nullable=False)