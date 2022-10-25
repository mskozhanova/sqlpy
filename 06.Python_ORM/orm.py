import sqlalchemy
import sqlalchemy as sq
from sqlalchemy.orm import declarative_base, relationship, sessionmaker
import json

Base = declarative_base()

class Publisher(Base):
    __tablename__ = "publisher"

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.String(length=255), unique=True, nullable=False)

class Shop(Base):
    __tablename__ = "shop"

    id = sq.Column(sq.Integer, primary_key=True)
    name = sq.Column(sq.String(length=255), unique=True, nullable=False)

class Book(Base):
    __tablename__ = "book"

    id = sq.Column(sq.Integer, primary_key=True)
    title = sq.Column(sq.String(length=255), nullable=False)
    id_publisher = sq.Column(sq.Integer, sq.ForeignKey("publisher.id"), nullable=False)


class Stock(Base):
    __tablename__ = "stock"

    id = sq.Column(sq.Integer, primary_key=True)
    id_book = sq.Column(sq.Integer, sq.ForeignKey("book.id"), nullable=False)
    id_shop = sq.Column(sq.Integer, sq.ForeignKey("shop.id"), nullable=False)
    count = sq.Column(sq.Integer, nullable=False)

class Sale(Base):
    __tablename__ = "sale"

    id = sq.Column(sq.Integer, primary_key=True)
    id_stock = sq.Column(sq.Integer, sq.ForeignKey("stock.id"), nullable=False)
    count = sq.Column(sq.Integer, nullable=False)
    price = sq.Column(sq.Float, nullable=False)
    date_sale = sq.Column(sq.Date, nullable=False )

def create_tables(engine):
    # Base.metadata.drop_all(engine)
    Base.metadata.create_all(engine)


def task2():
    publisher = (input('input publisher name or id: ')).strip()
    if publisher.isnumeric():
        q = session.query(Publisher).filter(Publisher.id == int(publisher))
    else:
        q = session.query(Publisher).filter(Publisher.name.like(f"%{publisher}%"))

    #print(q)

    result = q.all()
    #print(result)

    if len(result) > 0:
        for s in result:
            print(f"Result: {s.id, s.name}")
    else:
        print('No data found sorry')



def task3():
    with open('tests_data.json', 'r', encoding='utf-8') as f:
        text = json.load(f)

    result = []
    for i in range(0, len(text)):
        obj = text[i]
        print(obj)
        model = obj['model']
        fields = obj['fields']
        r = None
        if model == 'publisher':
            r = Publisher(name=fields['name'])
        elif model == 'book':
            r = Book(title=fields['title'], id_publisher=fields['id_publisher'])
        elif model == 'shop':
            r = Shop(name=fields['name'])
        elif model == 'stock':
            r = Stock(count=fields['count'], id_shop=fields['id_shop'], id_book=fields['id_book'])
        elif model == 'sale':
            r = Sale(count=fields['count'], id_stock=fields['id_stock'], price=fields['price'], date_sale=fields['date_sale'])

        if r is not None:
            session.add(r)
            session.commit()



DSN = "postgresql://postgres:123@localhost:5432/bookstore_db"
engine = sqlalchemy.create_engine(DSN)
create_tables(engine)

Session = sessionmaker(bind=engine)
session = Session()

# Задание 2
task2()

# Задание 3
#task3()