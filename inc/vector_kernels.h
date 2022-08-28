
#include <cuda_runtime_api.h>
#include <cuda.h>



/*  
 1- vector_add_kernel -> the kernel of adding 2 vectors
 2- run_vector_add_kernel -> utilty function to run the test

*/
__global__
void vector_add_kernel(int * a, int * b ,int * result);
void run_vector_add_kernel();


