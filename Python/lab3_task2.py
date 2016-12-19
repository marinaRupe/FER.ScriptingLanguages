import math

def print_header(step):
    print ("Hyp", end='')
    for i in [x * step for x in range(1, 10)]:
        print ("#Q" + str(round(i * 100)), end='')

def print_hd(hypothesis, step, i):
    length = len(hypothesis)
    print("\n{:03d}".format(i), end='')

    for q in [x * step for x in range(1, 10)]:
        hd_distance = float(hypothesis[math.floor(q * length)])
        print ("#" + str(round(hd_distance, 2)), end='')

input_file = 'ulaz.txt'
step = 0.1
hypotheses = list()

with open(input_file) as file:
    for line in file:
        hypothesis = sorted(line.strip().split(), key = lambda x: float(x))
        hypotheses.append(hypothesis)

print_header(step)
for hypothesis in hypotheses:
    print_hd(hypothesis, step, hypotheses.index(hypothesis)+1)


