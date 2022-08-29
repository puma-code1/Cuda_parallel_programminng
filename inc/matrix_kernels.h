
#include <cuda_runtime_api.h>
#include <cuda.h>



__global__ 
void mm_kernel(float* A, float* B, float* C, int n);
void run_mm_kernel();
void run_travese_threshold_matrix_kernel(uint16_t * mat, int threshold, uint32_t mat_size);
__global__ 
void travese_threshold_matrix_kernel(uint16_t * mat, int threshold, uint32_t size );