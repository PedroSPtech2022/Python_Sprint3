
from statistics import mean
import subprocess
import time
import psutil
import numpy
import datetime
import functools
import operator
import pyodbc 
import textwrap

def Conexao():

        # variaveis de conexao
        driver ='{ODBC Driver 18 for SQL Server}'
        server_name = 'montioll'
        database_name = 'Monitoll'
        server = '{server_name}.database.windows.net,1433'.format(server_name=server_name)
        username = 'Monitoll'
        password = 'Grupo7@123'
        # definindo banco url 
        connection_string = textwrap.dedent('''
        Driver={driver};
        Server={server};
        Database={database};
        Uid={username};
        Pwd={password};
        Encrypt=yes;
        TrustedServerCertificate=no;
        Connection Timeout=10;
        '''.format(
            driver=driver,
            server=server,
            database=database_name,
            username=username,
            password=password
        )) 

        cnxn:pyodbc.Connection = pyodbc.connect(connection_string) 

        global crsr
        crsr = cnxn.cursor()
        print("Conectado ao banco de dados: MoniToll")

# Bloco pegar temperatura 



def teste():
        print("Inserindo leitura no banco...")
        datahora = datetime.datetime.now().strftime('%d/%m/%Y %H:%M:%S')
        print(datahora)
        var_leitura2 = 31
        desempenho = 3.5
        idTorre = 136
        
        try:
            # Executando comando SQL   
            crsr.execute('''
        INSERT INTO Leitura (Leitura, DataHora, fkTorre, fkComponente) VALUES (?, ?, ?, ?)
        ''',var_leitura2, datahora, idTorre , 22)
            # Commit de mudanças no banco de dados
            crsr.commit()
            print("Leitura inserida no banco")
        except pyodbc.Error as err:
            cnxn.rollback()
            print("Something went wrong: {}".format(err))

        if (var_leitura2 > 30):
                var_leitura2 = desempenho 
        try:
            # Executando comando SQL   
            crsr.execute('''
        INSERT INTO Leitura (Leitura, DataHora, fkTorre, fkComponente) VALUES (?, ?, ?, ?)
        ''',var_leitura2, datahora, idTorre , 24)
            # Commit de mudanças no banco de dados
            crsr.commit()
            print("Leitura inserida no banco")

        except pyodbc.Error as err:
            cnxn.rollback()
            print("Something went wrong: {}".format(err))
        else:
            cnxn.rollback()
            print("Something went wrong: {}".format(err))     
            
Conexao()
while True:
    teste()
    time.sleep(5)
