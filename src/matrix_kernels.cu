
#include<matrix_kernels.h>
#include<iostream>
// matrix muptipication

//dim3 blockDim(size_t blockDimX, size_t blockDimY) 16X16  - 300 blocks of 256  
//dim3 gridDim(size_t gridDimX, size_t gridDimY)  30X30
// or we can do 32X32 blockDim, 15X15 gridDim  - 225 blocks of 1024
// 



__global__ void mm_kernel(float* A, float* B, float* C, int n)
{
    float temp_sum = 0 ;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    if (row < n && col < n) {
        for (int i = 0; i < n; ++i) {
             temp_sum += A[row * n + i] * B[i * n + col];
        }
        C[row * n + col] = temp_sum;
    }
}
//mm_kernel << <dimGrid, dimBlock >> > (d_a, d_b, d_c, n);



void run_mm_kernel()
{
    
}


// if below threashold make it zero
__global__ 
void travese_threshold_matrix_kernel(uint16_t * mat, int threshold, uint32_t size )
{

   
   // very important traverse each pixel with mul of y
    int index = blockDim.x * blockIdx.x + threadIdx.x + 480*(blockDim.y * blockIdx.y + threadIdx.y);
    //int index = blockDim.x * blockIdx.x + threadIdx.x;

    if(index < size && mat[index ]< threshold)
        {
         mat[index] = 33;
        }
   
}

void run_travese_threshold_matrix_kernel(uint16_t * mat, int threshold, uint32_t mat_size)
{

    // allocate memory on the cpu
    uint16_t * h_a = (uint16_t *) malloc(sizeof(uint16_t)*mat_size);
    

    // init mat test

    for(int i = 0 ; i<mat_size ;i++ )
        {
           if(i & 1)
                h_a[i] = 100;
            else
                h_a[i] = 10;
            
        }

    // allocate memory on the gpu
    uint16_t * d_a ;
    
    cudaMalloc(&d_a,sizeof(uint16_t)*mat_size);
    
    // copy host vectors to device vectors
    cudaMemcpy( d_a, h_a, mat_size * sizeof(uint16_t),cudaMemcpyHostToDevice );


    // run the kernel
     dim3 grid_size_ (16,16); //256; //  ;//grid_size_ = 256;  // 256 blocks
     dim3 block_size_ (32,32); // 1024 threads in block
    travese_threshold_matrix_kernel <<<grid_size_,block_size_>>>(d_a, threshold, mat_size);

    // copy the result from device to host
    cudaError err  = cudaMemcpy( h_a , d_a, mat_size * sizeof(uint16_t),cudaMemcpyDeviceToHost );

    //check the answer
    for (int i = 0 ; i < mat_size ; i++)
        {
            
                std::cout<<h_a[i] <<" ";
            
            
        }
        std::cout<<std::endl;


    // free memory cpu
    delete  h_a;

    //free memory gpu
    cudaFree(d_a);
  
}