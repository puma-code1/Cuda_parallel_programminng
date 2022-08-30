
#include <vector_kernels.h>
#include <auxilliary.h>
#include <iostream>
#include <string>
#include "matrix_kernels.h"




int main () 
{
    PIXEL_TYPE buff_image[230400];
    bool status = false;

    std::string load_file_path = "/home/lab/Desktop/Eliran/kaya-tutorial/Frame number_0.raw";
    std::string save_file_path_name = "/home/lab/Desktop/Eliran/test_data_function";
  status = save_image(buff_image, save_file_path_name, file_type::txt , IMG_SIZE_BYTES,IMG_WIDTH) ;

  if(!status)
  {
      std::cout<<"save file function failed!\n";
  }
    /* 
    for(int i =0; i< 1000; i++)
    {
        test[i] = buff_image[i];
       // std::cout<< buff_image[i] <<' ';
        std::cout<<test[0];
    }
*/

  //  run_vector_add_kernel();
   run_travese_threshold_matrix_kernel( buff_image, 50, 230400);

      
    return 0;
}