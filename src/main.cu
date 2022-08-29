
#include <vector_kernels.h>
#include <auxilliary.h>
#include <iostream>
#include "matrix_kernels.h"

#define IMG_SIZE 460800
 


int main () 
{
    uint16_t buff_image[230400];
//    uint16_t test[1000];
  //  test[0] = 8;
   // test[1] = 6 ;
    const char * path = "/home/lab/Desktop/Eliran/kaya-tutorial/Frame number_0.raw";
    //const char * file_name  = "data";
    // load an image test
    load_img(path, buff_image, IMG_SIZE);
    save_image_raw(buff_image, "test_output", "input" , IMG_SIZE/2 );
    /* 
    for(int i =0; i< 1000; i++)
    {
        test[i] = buff_image[i];
       // std::cout<< buff_image[i] <<' ';
        std::cout<<test[0];
    }
*/
   

    save_image_raw(buff_image, "test_output", "output" , IMG_SIZE/2 );
  //  run_vector_add_kernel();
   run_travese_threshold_matrix_kernel( buff_image, 50, 230400);

      
    return 0;
}