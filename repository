import pymysql
from dataclasses import dataclass


@dataclass
class db_initialiser:

    connection = pymysql.connect(
        host='localhost',
        user='root',
        password='password',
        database='unifydb',
    )
    cursor = connection.cursor()
    sql_file = "unify-schema.sql"

    def parse_sql(self):
        data = open(self.sql_file, 'r').readlines()
        statements = []
        DELIMITER = ';'
        statement = ''

        for lineno, line in enumerate(data):
            if not line.strip():
                continue

            if line.startswith('--'):
                continue

            if 'DELIMITER' in line:
                DELIMITER = line.split()[1]
                continue

            if (DELIMITER not in line):
                statement += line.replace(DELIMITER, ';')
                continue

            if statement:
                statement += line
                statements.append(statement.strip())
                statement = ''
            else:
                statements.append(line.strip())
        return statements

    def execute_statements(self, statements):
        for statement in statements:
            try:
                self.cursor.execute(statement)
                print("++++++++Success+++++++++")
            except Exception as e:
                print(e)
        self.connection.commit()

    def close_connection(self):
        self.connection.close()


db_init = db_initialiser()
statements = db_init.parse_sql()
db_init.execute_statements(statements)
