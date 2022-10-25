import psycopg2
from psycopg2.errorcodes import UNIQUE_VIOLATION
from psycopg2 import errors

class DBApi:
    conn = None

    def __init__(self, db, pwd, user="postgres", host="localhost"):
        self.conn = psycopg2.connect(database=db, user="postgres", host="localhost", password=pwd)

    def __del__(self):
        if self.conn is not None:
            self.conn.close()

    def drop_tables(self):
        self._connect_db("drop table clientsphones")
        self._connect_db("drop table clients")

    #Функция, создающая структуру БД (таблицы)
    def create_tables(self):
        self._connect_db("""
                CREATE TABLE IF NOT EXISTS clients(
                    id SERIAL PRIMARY KEY,
                    name VARCHAR(255) not null,
                    surname VARCHAR(255) not null,
                    email VARCHAR(255) unique
                );
                """)
        self._connect_db("""
                               CREATE TABLE IF NOT EXISTS clientsphones(
                                   id SERIAL PRIMARY KEY,
                                   client_id INTEGER NOT NULL REFERENCES clients(id),
                                   phonenumber INTEGER unique NOT NULL
                               );
                               """)


    #Функция, позволяющая добавить нового клиента
    def add_client(self, name, surname, email):
        sql = f"INSERT INTO clients(name, surname, email) VALUES('{name}', '{surname}', '{email}')  RETURNING id;"
        try:
            ids = self._connect_db(sql, None, True)
        except errors.lookup(UNIQUE_VIOLATION) as e:
            print("EMAIL: UNIQUE_VIOLATION occured")
            ids = self.find_client({'email': email}, ['id'])
        if ids != None:
            return ids[0][0]

    #Функция, позволяющая добавить телефон для существующего клиента
    def add_client_phone(self, client_id: int, phonenumber):
        sql = f"INSERT INTO clientsphones(client_id, phonenumber) VALUES({client_id}, '{phonenumber}')  RETURNING id;"
        try:
            ids = self._connect_db(sql, None, True)
        except errors.lookup(UNIQUE_VIOLATION) as e:
            print("PHONENUMBER: UNIQUE_VIOLATION occured")
            ids = self.find_client({'phonenumber': phonenumber}, ['id'])
            self._connect_db(f"UPDATE clientsphones SET client_id=%s WHERE phonenumber=%s;", (client_id, phonenumber,), False)
        if ids != None:
            return ids[0][0]

    #Функция, позволяющая изменить данные о клиенте
    def update_client(self, client_id: int, client_data):
        keys = []
        values1 = []
        for i in client_data:
            keys.append(f"{i}=%s")
            values1.append(client_data[i])
        values1.append(client_id)
        values =  tuple(values1)
        sql = f"UPDATE clients SET {', '.join(keys)} WHERE id=%s;"
        self._connect_db(sql, values, False)

    #Функция, позволяющая удалить телефон для существующего клиента
    def delete_client_phonenumber(self, client_id: int):
        sql = f"DELETE from clientsphones WHERE client_id=%s;"
        self._connect_db(sql, (client_id,), False)

    #Функция, позволяющая удалить существующего клиента
    def delete_client(self, client_id: int):
        db.delete_client_phonenumber(client_id)
        sql = f"DELETE from clients WHERE id=%s;"
        self._connect_db(sql, (client_id,), False)

    #Функция, позволяющая найти клиента по его данным (имени, фамилии, email-у или телефону)
    def find_client(self, client_data, client_keys = None):
        keys = []
        values1 = []
        phonenumber = None
        client_id = None

        if client_keys == None:
            client_keys = '*'
        for i in client_data:
            if i == 'phonenumber':
                phonenumber = client_data[i]
                client_data = self._connect_db("SELECT client_id from clientsphones where phonenumber=%s", (phonenumber,), True)
                client_id = client_data[0][0]
            else:
                keys.append(f"{i}=%s")
                values1.append(client_data[i])
        if client_id != None:
            values1.append(client_id)
            keys.append('id=%s')
        elif phonenumber != None:
            return None

        values =  tuple(values1)
        sql = f"SELECT {', '.join(client_keys)} from clients WHERE {' AND '.join(keys)};"
        id = self._connect_db(sql, values, True)
        return id

    #вспомогательная функция
    def _connect_db(self, sql, values = None, return_data = False):
        return_data = return_data == True
        data = None
        with self.conn as conn:
            with conn.cursor() as cur:
                if values is None:
                    cur.execute(sql)
                else:
                    cur.execute(sql, values)
                conn.commit()
                if return_data:
                    data = cur.fetchall()
        return data

db =  DBApi("clients_db", "123")

#удалить таблицы
#db.drop_tables()

#создать таблицы
db.create_tables()

#создать клиента. Если такой емейл уже есть в БД, то вернется ID клиента с этим email
client_id = db.add_client('Maria', 'Kozh', 'm.kozh@ya.ru')
client_id1 = db.add_client('Jane', 'Doe', 'j.d@ya.ru')

#создать телефон клиента. Если такой телефон уже зарегистрирован, то присвоить его этому клиенту
if client_id:
    client_phone_id = db.add_client_phone(client_id, '12345678')
if client_id1:
    client_phone_id1 = db.add_client_phone(client_id1, '9876543')

print(client_id)
print(client_phone_id)

#обновить данные клиента
db.update_client(client_id, {'name': 'Mariia'})

#найти клиента
client_data1 = db.find_client({'phonenumber': '12345678'}, ['id', 'name', 'email'])
print(client_data1)

#удалить телефон клиента
#db.delete_client_phonenumber(client_id)
#db.delete_client_phonenumber(client_id1)

#удалить клиента
#db.delete_client(client_id)
#db.delete_client(client_id1)

#уничтожить объект
del db