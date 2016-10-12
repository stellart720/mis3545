import random

grades = [(x, y, z / 10) for x in range(1, 11)
          for y in range(1, 5) for z in range(20, 40)]

grades_sample = random.sample(grades, 20)

for i in range(20):
    print('{}\t{}\t{}\t{}'.format(
        i + 1, grades_sample[i][0], grades_sample[i][1], grades_sample[i][2]))
