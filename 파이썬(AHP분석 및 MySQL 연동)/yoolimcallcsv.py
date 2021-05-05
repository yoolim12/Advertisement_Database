import csv
import numpy as np
import math

print("가중치를 매길 항목들(1): 0. 품목 별 광고 관심도/ 1. 광고 주목도/")
print("2. 광고 관심도/ 3. 광고 이미지 평가/4. 매체 접점\n\n")

print("0. 매체 접점(구매)/1. 매체 호감/2. 매체 인지\n")

print("\n점수: 1-중요도가 같다, 3-약간 더 중요, 5-꽤 더욱 중요, 7-상당히 더 중요, 9-절대적으로 더 중요\n")

WEIGHT_COUNT_1 = 5
WEIGHT_COUNT_2 = 3
SURVEY_PEOPLE = 10

weight_1 = ["0. 품목 별 광고 관심도", "1. 광고 주목도", "2. 광고 관심도", "3. 광고 이미지 평가", "4. 매체 접점"]
weight_2 = ["0. 매체 접점(구매)", "1. 매체 호감", "2. 매체 인지"]



def Decide(cr, WEIGHT_NUM,weight_things):
    if(cr > 0.1):
        print("\n판단의 일관성이 없습니다. 쌍대 비교를 다시 하십시오.")
        Compare(weight_things, WEIGHT_NUM)
    else:
        print("\n일관성 있습니다. 가중치를 이용해도 좋습니다.")

def ConsistencyCheck(importance, eigen,WEIGHT_NUM,weight_things):
    imp_eig = np.zeros((WEIGHT_NUM,WEIGHT_NUM))

    print("\n쌍대 비교 행렬의 해당 항목들의 열에 각 항목에 대한 상대적 가중치를 곱합니다. 결과는 다음과 같습니다.\n")
    
    for column in range(WEIGHT_NUM):
        for row in range(WEIGHT_NUM):
            imp_eig[row,column] = eigen[column] * importance[row,column]

    print(imp_eig)

    sum_row = []
    total = 0

    for element in range(WEIGHT_NUM):
        sum_row.append(0)

    for row in range(WEIGHT_NUM):
        for column in range(WEIGHT_NUM):
            sum_row[row] += imp_eig[row,column]
        total += sum_row[row]/eigen[row]

    lambda_max = total/WEIGHT_NUM

    RI_List = [0, 0, 0, 0.58, 0.90, 1.12, 1.24, 1.32, 1.14, 1.45, 1.49]

    ci = (lambda_max - WEIGHT_NUM)/(WEIGHT_NUM-1)
    ri = RI_List[WEIGHT_NUM]
    cr = ci/ri
    
    print("\nci: ", ci)
    print("ri: ", ri)
    print("cr(= ci/ri):  ", cr)

    Decide(cr,WEIGHT_NUM,weight_things)

def AHP(importance, weight_things, WEIGHT_NUM):    
    print("\n\n쌍대 비교 행렬은 다음과 같습니다\n")
    print(importance)
    
    array_multi = np.dot(importance, importance)
    print("\n쌍대 비교 행렬의 곱은 다음과 같습니다\n")
    print(array_multi)

    total = 0
    eigen = []

    for element in range(WEIGHT_NUM):
        eigen.append(0)

    for row in range(WEIGHT_NUM):
        for column in range(WEIGHT_NUM):
            eigen[row] += array_multi[row, column]
        total += eigen[row]

    for i in range(WEIGHT_NUM):
        print("\n", weight_things[i], ": ", eigen[i]/total)

    print("\n\n각 항목에 대한 상대적인 가중치: ", eigen/total)

    ConsistencyCheck(importance, eigen,WEIGHT_NUM,weight_things)


def Compare(weight_things, weight):
    if(weight == WEIGHT_COUNT_1):
        total_arrays = []

        survey_1 = open("설문1.csv", 'r', encoding='utf-8')
        rdr = csv.reader(survey_1)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_1.close()
            
        survey_2 = open('설문2.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_2)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_2.close()

        survey_3 = open('설문3.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_3)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_3.close()

        survey_4 = open('설문4.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_4)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_4.close()

        survey_5 = open('설문5.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_5)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_5.close()

        survey_6 = open('설문6.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_6)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_6.close()

        survey_7 = open('설문7.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_7)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_7.close()

        survey_8 = open('설문8.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_8)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_8.close()

        survey_9 = open('설문9.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_9)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_9.close()

        survey_10 = open('설문10.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_10)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_10.close()

    if(weight == WEIGHT_COUNT_2):
        total_arrays = []
        survey_11 = open('설문11.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_11)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_11.close()

        survey_12 = open('설문12.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_12)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_12.close()

        survey_13 = open('설문13.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_13)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_13.close()

        survey_14 = open('설문14.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_14)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_14.close()

        survey_15 = open('설문15.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_15)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_15.close()

        survey_16 = open('설문16.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_16)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_16.close()

        survey_17 = open('설문17.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_17)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_17.close()

        survey_18 = open('설문18.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_18)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_18.close()

        survey_19 = open('설문19.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_19)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_19.close()

        survey_20 = open('설문20.csv', 'r', encoding='utf-8')
        rdr = csv.reader(survey_20)
        surv=[]
        for line in rdr:
            for element in line:
                surv.append(float(element))
        arr=np.array(surv).reshape(weight,weight)
        total_arrays.append(arr)
        survey_20.close()
    
    total_importance = np.ones((weight,weight))

    for element in range(SURVEY_PEOPLE):
        total_importance *= total_arrays[element]
            
        if(element == SURVEY_PEOPLE-1):
            for row in range(weight):
                for column in range(weight):
                    total_importance[row,column] = math.pow(total_importance[row,column],1/SURVEY_PEOPLE)
            
    AHP(total_importance, weight_things, weight)

Compare(weight_1, WEIGHT_COUNT_1)
Compare(weight_2, WEIGHT_COUNT_2)
