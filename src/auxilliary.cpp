#include <iostream>
#include <fstream>
#include <auxilliary.h>

bool save_image(PIXEL_TYPE * buffer ,std::string full_file_name,  file_type type, size_t size_in_bytes, int x_dim)
{
    std::ofstream outdata; // outdata is like cin
    int i; // loop index
    int num[5] = {4, 3, 6, 7, 12}; // list of output values

    switch (type)
    {
        case file_type::bin:
            outdata.open(full_file_name + ".raw" , std::ios::binary); // opens the file
            if( !outdata ) 
            { // file couldn't be opened
                std::cerr << "Error: file could not be opened" << std::endl;
            return false;
            }

            for (i=0; i<size_in_bytes; ++i)
                outdata << num[i];
            break;

        case file_type::txt:
            outdata.open(full_file_name + ".txt"); // opens the file
            if( !outdata ) 
                { // file couldn't be opened
                std::cerr << "Error: file could not be opened" << std::endl;
                return false;
                }   
            for (int i=0; i<size_in_bytes; ++i)
                {
                    for (int j = 0 ; j < x_dim; j++)
                      {
                         outdata << num[i]<<','; 
                      }
                outdata << std::endl;
                 }
        
        default:
            break;
    }

    outdata.close();
    return true;
}



bool load_img(std::string path, PIXEL_TYPE buff_image, int img_size)
{

    return true;
}