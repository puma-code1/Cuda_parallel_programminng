
#include <cuda_runtime_api.h>
#include <cuda.h>


 





__global__ void mm_kernel(float* A, float* B, float* C, int n);
void run_mm_kernel();