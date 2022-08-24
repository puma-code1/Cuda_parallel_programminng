#pragma once
#include <iostream>

#define N  3
typedef uint16_t pixel_type;

void mul_matrix_cpu(pixel_type* mat1, pixel_type* mat2, pixel_type* result_mat);
bool cmp_matrix_cpu(pixel_type* mat1, pixel_type* mat2);
void print_mat_cpu(pixel_type* mat);