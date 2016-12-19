def create_matrix(input_file, start, end):
    matrix = dict()

    with open(input_file) as file:
        for i, line in enumerate(file):
            line = line.strip().split()
            if i == start:
                (rows, columns) = int(line[0]), int(line[1])

            if start < i <= end:
                (row, column, value) = int(line[0]), int(line[1]), float(line[2])
                if row <= rows and column <= columns :
                    matrix[row, column] = value
                else:
                    print ("Incorrectly entered value!"); exit(1)
            elif i > end: break

        return (matrix, [rows, columns])

def matrix_product (matrix1, matrix1_dimension, matrix2, matrix2_dimension):
    (matrix1_rows, matrix1_columns) = matrix1_dimension
    (matrix2_rows, matrix2_columns) = matrix2_dimension
    matrix_product = list()
    if matrix1_columns != matrix2_rows:
        print ("Matrices are not aligned!"); exit(1)
    else:
        for i in range(1, matrix1_rows + 1):
            matrix_row = list()
            for j in range(1, matrix2_columns + 1):
                matrix_element = 0
                for k in range(1, matrix1_columns + 1):
                    matrix_element += (matrix1.get((i, k), 0) * matrix2.get((k, j), 0))
                matrix_row.append(matrix_element)

            matrix_product.append(matrix_row)

        return (matrix_product, [matrix1_rows, matrix2_columns])

def print_matrix (matrix, matrix_dimension):
    (rows, columns) = matrix_dimension
    for i in range(0, rows):
        for j in range(0, columns):
            print(matrix[i][j], end='  ')
        print()

def matrix_to_output_file(matrix, matrix_dimension, output_file):
    (rows, columns) = matrix_dimension
    with open(output_file, 'w') as file:
        file.write(str(rows) + ' ' + str(columns) + '\n')
        for i in range(0, rows):
            for j in range(0, columns):
                if matrix[i][j] != 0:
                    file.write(str(i + 1) + ' ' + str(j + 1) + ' ' + str(matrix[i][j]) + '\n')

input_file = 'matrix.txt'
output_file = 'matrixProduct.txt'

with open(input_file) as file:
    matrix1_start = 0
    for i, line in enumerate(file):
        if line == '\n':
            matrix1_end = i - 1
            matrix2_start = i + 1
    matrix2_end = i

(matrix1, matrix1_dimension) = create_matrix(input_file, matrix1_start, matrix1_end)
(matrix2, matrix2_dimension) = create_matrix(input_file, matrix2_start, matrix2_end)
(matrix_product, matrix_product_dimension) = matrix_product(matrix1, matrix1_dimension, matrix2, matrix2_dimension)

print_matrix(matrix_product, matrix_product_dimension)
matrix_to_output_file(matrix_product, matrix_product_dimension, output_file)