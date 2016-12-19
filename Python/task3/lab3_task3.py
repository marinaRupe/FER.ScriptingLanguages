import os

def print_header(lab_numbers):
    print("{:12s} {:18s}".format("JMBAG", "Prezime, Ime"), end=' ')
    for number in lab_numbers:
        print("{:>s}{:d}".format("L", number), end=' '*5)

def print_student_records(students, lab_numbers):
    for jmbag in students.keys():
        student_info = ", ".join(students[jmbag][0:2])
        print("\n{:12s} {:18s}".format(jmbag,  student_info), end=' ')

        for number in lab_numbers:
            if(students[jmbag][2].get(number) is not None):
                points = students[jmbag][2][number][1]
            else:
                points = "0.0"
            print("{:6s}".format(points), end=' ')


student_file = "studenti.txt"; task_name = "lab3_task3.py"
students = dict()

with open(student_file) as studfile:
    for line in studfile:
        student_lab_info = dict()
        student = line.strip().split()
        students[student[0]] = student[1:]
        students[student[0]].append(student_lab_info)

lab_files = os.listdir(".")
lab_files.remove(student_file); lab_files.remove(task_name); lab_files.sort()

lab_numbers = list()
for lab_file in lab_files:
    lab_info = lab_file.split(".")[0].split("_")
    lab_number = int(lab_info[1]); lab_numbers.append(lab_number)
    lab_group = lab_info[2]

    with open(lab_file) as lab:
        for line in lab:
            record = line.strip().split()
            jmbag = record[0]; points = record[1]

            if (students[jmbag][2].get(lab_number) is None):
                students[jmbag][2][lab_number] = [lab_group, points]

            else:
                print("Warning: student {} is on more than one list for lab {}!\n".format(jmbag, str(lab_number)))

lab_numbers = list(sorted(set(lab_numbers)))
print_header(lab_numbers)
print_student_records(students, lab_numbers)


