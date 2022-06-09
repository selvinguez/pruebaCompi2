numero = [3,4,6,7,2]
numero2 = [0,0,0,0,0]

n = 0
for i in numero:
  if (i % 2) == 0:
    numero2[n] = i
    n = n + 1
    
for i in numero:
  
  if (i % 2) == 1:
    numero2[n] = i
    n = n + 1

print(numero2)

