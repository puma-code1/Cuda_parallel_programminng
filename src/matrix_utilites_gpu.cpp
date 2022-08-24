

// matrix muptipication

//dim3 blockDim(size_t blockDimX, size_t blockDimY) 16X16  - 300 blocks of 256  
//dim3 gridDim(size_t gridDimX, size_t gridDimY)  30X30
// or we can do 32X32 blockDim, 15X15 gridDim  - 225 blocks of 1024
// 


/*
__global__ void mm_kernel(float* A, float* B, float* C, int n)
{
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    if (row < n && col < n) {
        for (int i = 0; i < n; ++i) {
            C[row * n + col] += A[row * n + i] * B[i * n + col];
        }
    }
}
mm_kernel << <dimGrid, dimBlock >> > (d_a, d_b, d_c, n);
*/