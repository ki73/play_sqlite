import sqlite3
from sqlite3 import Error
import json


def create_connection(db_file):
    conn = None
    try:
        conn = sqlite3.connect(db_file)
    except Error as e:
        print(e)

    return conn


def select_foo(conn):
    cur = conn.cursor()
    cur.execute("SELECT * FROM foo")

    rows = cur.fetchall()

    # for row in rows:
    #     print(row)

    return json.dumps(rows)


def main():
    database = "sqlite.db"

    conn = create_connection(database)
    with conn:
        output_json = select_foo(conn)
        print(output_json)


if __name__ == '__main__':
    main()
