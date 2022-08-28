
cmake_minimum_required(VERSION 3.18)

# This is your project statement. You should always list languages;
# Listing the version is nice here since it sets lots of useful variables
project(cuda_add_vec.out VERSION 1.0 LANGUAGES CUDA CXX)

#find_package(CUDA 11.6 REQUIRED)



# specify the C++ standard
#set(CMAKE_CXX_STANDARD 17)
#set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_BUILD_TYPE RelWithDebInfo)




# include headers path




#link_directories(${CMAKE_SOURCE_DIR}/lib)


set(HEADERS ./inc/vector_kernels.h  )
set(SRC ./src/main.cu ./src/vector_kernels.cu )#./src/main.cpp ) #./src/KYFGLib_Example.c ./src/stdafx.c)

#add library
#add_library(MyLibExample simple_lib.cpp simple_lib.hpp)

# Link each target with other targets or add options, etc.

# Adding something we can run - Output name matches target name
add_executable(${PROJECT_NAME} ${SRC} ${HEADERS})
target_compile_features(${PROJECT_NAME} PUBLIC cxx_std_17)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_SOURCE_DIR}/inc)
#set_target_properties (${PROJECT_NAME} PROPERTIES LINKER_LANGUAGE CXX)
#target_link_libraries(${PROJECT_NAME}  LINK_PUBLIC debug ${CUDA_})
#target_include_directories(${PROJECT_NAME} PUBLIC ./inc)




