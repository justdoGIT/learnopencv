cmake_minimum_required(VERSION 3.18)
project(opencv5_companion_smoke LANGUAGES CXX)

option(OPENCV5_EXPECT_CUDA "Execute and require CUDA runtime operations" OFF)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(OPENCV5_COMPONENTS core imgproc imgcodecs features xfeatures2d)
if(OPENCV5_EXPECT_CUDA)
  list(APPEND OPENCV5_COMPONENTS cudaarithm cudaimgproc)
endif()

find_package(OpenCV 5.0.0 EXACT REQUIRED COMPONENTS ${OPENCV5_COMPONENTS})

add_executable(opencv5_companion_smoke main.cpp)
target_link_libraries(opencv5_companion_smoke PRIVATE ${OpenCV_LIBS})
target_include_directories(opencv5_companion_smoke PRIVATE ${OpenCV_INCLUDE_DIRS})
target_compile_definitions(
  opencv5_companion_smoke
  PRIVATE OPENCV5_EXPECT_CUDA=$<BOOL:${OPENCV5_EXPECT_CUDA}>
)
