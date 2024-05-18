import pymysql

# Correct way to create a connection
connection = pymysql.connect(host='localhost', user='username', password='password', database='mydb')

