
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

def teste():
        print("Inserindo leitura no banco...")
        datahora = datetime.datetime.now().strftime('%d/%m/%Y %H:%M:%S')
        print(datahora)
        exec(strNome + " = " + strCodigo, globals())
        global var_leitura
        var_leitura = globals()[strNome]
        if strNome == 'processadores_nucleo_porcentagem':
            
            print(var_leitura)
            global var_leitura2
            var_leitura2 = mean(var_leitura)
            print(var_leitura2)
        elif strNome == 'pacotes_perdidos_porcentagem':
            print('caiu no elif 1')
            var_leitura2 = round((((pacotes_perdidos_porcentagem[1] - pacotes_perdidos_porcentagem[0])/pacotes_perdidos_porcentagem[1])*100), 1)
        elif strNome == 'processadores_nucleo_porcentagem':
            print('caiu no elif 2')
            var_leitura2 = numpy.mean(var_leitura) 
        elif strNome == 'temperatura':
            print('caiu no elif 3')
            var_leitura2 = (var_leitura)  
            teste2()            
        else:
            print('caiu no else')
            var_leitura2 = var_leitura
        print(var_leitura2)

        
        try:
            # Executando comando SQL   
            crsr.execute('''
        INSERT INTO Leitura (Leitura, DataHora, fkTorre, fkComponente) VALUES (?, ?, ?, ?)
        ''',var_leitura2, datahora, idTorre , y)
            # Commit de mudanças no banco de dados
            crsr.commit()
            print("Leitura inserida no banco")
        except pyodbc.Error as err:
            crsr.rollback()
            print("Something went wrong: {}".format(err))


def teste2():
        print("Inserindo leitura no banco...")
        datahora = datetime.datetime.now().strftime('%d/%m/%Y %H:%M:%S')
        print(datahora)
        

        if (var_leitura > 55 | var_leitura2 > 55):
            var_leitura2 = 3.5
        try:
            # Executando comando SQL   
            crsr.execute('''
        INSERT INTO Leitura (Leitura, DataHora, fkTorre, fkComponente) VALUES (?, ?, ?, ?)
        ''',var_leitura2, datahora, 136 , 24)
            # Commit de mudanças no banco de dados
            crsr.commit()
            print("Leitura inserida no banco")
        except pyodbc.Error as err:
            crsr.rollback()
            print("Something went wrong: {}".format(err))

Conexao()
while True:
    teste()
    time.sleep(5)