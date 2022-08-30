
#define PIXEL_TYPE uint16_t
#define IMG_WIDTH 480
#define IMG_HIGHT 480
#define IMG_SIZE IMG_WIDTH * IMG_WIDTH
#define IMG_SIZE_BYTES IMG_SIZE *sizeof(PIXEL_TYPE)

#include <string>

enum class file_type
{
    txt=0 , 
    bin=1
};


/* save a raw/txt image according to type enum */
bool save_image(PIXEL_TYPE * buffer ,std::string full_file_name,  file_type type, size_t size_in_bytes, int x_dim);
bool load_img(std::string path, PIXEL_TYPE buff_image, int img_size);