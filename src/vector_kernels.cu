
#include <vector_kernels.h>
#include<iostream>
#include<math.h>


#define vector_size 102400
#define numThreads 1024 // 500 threads in a block
//#define numBlocks 2  // 2 blocks

__global__
void vector_add_kernel(int * a, int * b ,int * result)

{
    uint32_t ind = blockDim.x * blockIdx.x + threadIdx.x;

    if(ind < vector_size)
        result[ind] = a[ind] + b[ind];
}



void run_vector_add_kernel()
{
    // allocate memory on the cpu
    int * h_a = (int *) malloc(sizeof(int)*vector_size);
    int * h_b = (int *) malloc(sizeof(int)*vector_size);
    int * h_c = (int *) malloc(sizeof(int)*vector_size);

    // init vector a & b , when add them the answer would be 1 in alll cells

    for(int i = 0 ; i<vector_size ;i++ )
        {
           
                h_a[i] = 1;
                h_b[i] = 1;
           
            
        }

       


    // allocate memory on the gpu
    int * d_a ;
    int * d_b ;
    int * d_c ;
    cudaMalloc(&d_a,sizeof(int)*vector_size);
    cudaMalloc(&d_b,sizeof(int)*vector_size);
    cudaMalloc(&d_c,sizeof(int)*vector_size);


    // copy host vectors to device vectors
    cudaMemcpy( d_a, h_a, vector_size * sizeof(int),cudaMemcpyHostToDevice );
    cudaMemcpy( d_b, h_b, vector_size * sizeof(int),cudaMemcpyHostToDevice );

    // run the kernel

    dim3 grid_size = (int)ceil(vector_size / numThreads);
    dim3 block_size = numThreads;

    vector_add_kernel<<<grid_size,block_size>>>(d_a , d_b , d_c);


    // copy the result from device to host
    cudaMemcpy( h_c , d_c, vector_size * sizeof(int),cudaMemcpyDeviceToHost );

    //check the answer
    for (int i = 0 ; i < vector_size ; i++)
        {
            std::cout<<h_c[i] << ' ';
        }
        std::cout<<std::endl;


    // free memory cpu
    delete  h_a;
    delete [] h_b;
    delete [] h_c;

    //free memory gpu
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_c);



}



