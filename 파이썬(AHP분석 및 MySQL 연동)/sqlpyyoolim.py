import numpy as np
import pymysql
#import mysql.connector

# MySQL Connection 연결
conn = pymysql.connect(host ='127.0.0.1',port= 3306, user = 'root',password='autoset', database='광고', charset='utf8')

# Connection 으로부터 Cursor 생성
curs = conn.cursor()

# SQL문 실행
sql = "select 10male, 20male, 30male, 40male, 50male, 10female, 20female, 30female, 40female, 50female from bqfit"
tuple_count=curs.execute(sql)

# 데이타 Fetch
rows = curs.fetchall()


#print(tuple_count)#sql로 뽑게 된 총 투플 개수를 출력
#print(rows)     # 전체 rows(sql에 해당하는 데이터들 출력)
#print(rows[0])  # 첫번째 row
#print(rows[1])  # 두번째 row

#data_num = tuple_count*10

data = []

array = np.array(rows)

for row in range(len(array)):
    for col in range(len(array[0])):
        data.append(array[row][col])

for i in range(len(data)):
    for j in range(i+1,len(data)):
        if(data[i] < data[j]):
            temp = data[j]
            data[j] = data[i]
            data[i]=temp

print("1st: ", data[0])
print("2st: ", data[1])
print("3st: ", data[2])
print("4st: ", data[3])
print("5st: ", data[4])

sql2 = "select media from bqfit"
tuple_count2=curs.execute(sql2)

rows2 = curs.fetchall()

array2 = np.array(rows2)

age_gender = ['10male', '20male', '30male', '40male', '50male', '10female', '20female', '30female', '40female', '50female']

for rownum in range(tuple_count):
    for columnnum in range(10):
        if(array[rownum][columnnum] == data[0]):
            print("1st 행렬에서의 위치: ","[",rownum,",",columnnum,"]")
            print("1st media: ", array2[rownum][0])
            print("1st media: ", age_gender[columnnum])

for rownum in range(tuple_count):
    for columnnum in range(10):
        if(array[rownum][columnnum] == data[1]):
            print("2st 행렬에서의 위치: ","[",rownum,",",columnnum,"]")
            print("2st media: ", array2[rownum][0])
            print("2st media: ", age_gender[columnnum])
            

for rownum in range(tuple_count):
    for columnnum in range(10):
        if(array[rownum][columnnum] == data[2]):
            print("3rd 행렬에서의 위치: ","[",rownum,",",columnnum,"]")
            print("3st media: ", array2[rownum][0])
            print("3st media: ", age_gender[columnnum])
            
            
for rownum in range(tuple_count):
    for columnnum in range(10):
        if(array[rownum][columnnum] == data[3]):
            print("4th 행렬에서의 위치: ","[",rownum,",",columnnum,"]")
            print("4th media: ", array2[rownum][0])
            print("4th media: ", age_gender[columnnum])

for rownum in range(tuple_count):
    for columnnum in range(10):
        if(array[rownum][columnnum] == data[4]):
            print("5rd 행렬에서의 위치: ","[",rownum,",",columnnum,"]")
            print("5th media: ", array2[rownum][0])
            print("5th media: ", age_gender[columnnum])

# Connection 닫기
conn.close()
