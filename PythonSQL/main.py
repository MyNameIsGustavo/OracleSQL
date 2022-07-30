import pyodbc

dados_conexao = (
    "Driver={SQL Server};"
    "Server=DESKTOP-33BELD0\SQLEXPRESS;"
    "Database=PythonSQL;"
)
conexao = pyodbc.connect(dados_conexao)
print("Conexão efetuada com sucesso!")

cursor = conexao.cursor()

id = 3
cliente = "Gustavo Rocha"
produto = "Notebook"
data = "29/07/2022"
preco = 5000
quantidade = 1


comando = f"""INSERT INTO Vendas(id_venda, cliente, produto, data_venda, preco, quantidade)
VALUES
	({id}, '{cliente}', '{produto}', '{data}', {preco}, {quantidade})"""

cursor.execute(comando)
cursor.commit()