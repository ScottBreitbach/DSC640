import csv

reader = csv.reader(open('birth-rate.csv', 'r'), delimiter = ",")

rowsSoFar = 0
print('year,rate')
for row in reader:
    if rowsSoFar == 0:
        header = row
        rowsSoFar +=1
    else:
        for i in range(len(row)):
            if i > 0 and row[i]:
                print(header[i] + ',' + row[i])
        rowsSoFar += 1