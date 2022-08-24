#include "matrix_utilites_cpu.h"


// true if they are the same
bool cmp_matrix_cpu(pixel_type* mat1, pixel_type* mat2)
{
	for (int row = 0; row < N; row++)
	{
		for (int col = 0; col < N; col++)
		{
			if (mat1[row * N + col] != mat2[row * N + col])
			{
				std::cout << "matrix difference in: " << "row- " << row << " col : " << col << std::endl;
				std::cout << "mat1 vlaue is: " << mat1[row * N + col] << "\nmat2 vlaue is: " << mat2[row * N + col] << std::endl;
			}
		}
	}
	return true;
}

// mul NXN matrixes
void mul_matrix_cpu(pixel_type* mat1, pixel_type* mat2, pixel_type* result_mat)
{
	uint32_t sum = 0;
	for (uint32_t row = 0; row < N; row++)
	{
		for (uint32_t col = 0; col < N; col++)
		{

			for (uint32_t width_index = 0; width_index < N; width_index++)
			{
				sum += mat1[row * N + width_index] * mat2[col + width_index * N];
			}
			result_mat[row * N + col] = sum;
			sum = 0;
		}
	}
}



void print_mat_cpu(pixel_type* mat)
{
	for (int row = 0; row < N; row++)
	{
		for (int col = 0; col < N; col++)
		{
			std::cout << mat[row * N + col] << ' ';
		}
		std::cout << std::endl;
	}
}