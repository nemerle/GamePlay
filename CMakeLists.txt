cmake_minimum_required(VERSION 2.6)

project(GamePlay)

set(GAMEPLAY_VERSION 2.0.0)
# set(CMAKE_C_COMPILER_INIT g++) not forcing g++ compiler

LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/CmakeScripts)

find_package(OpenAL REQUIRED)
find_package(glfw REQUIRED)
find_package(GLEW REQUIRED)
find_package(Lua REQUIRED)
find_package(Freetype REQUIRED)
find_package(ZLIB REQUIRED)
find_package(PNG REQUIRED)
find_package(Bullet REQUIRED)
find_package(Vorbis REQUIRED)
find_package(OpenGL REQUIRED)
find_package(Threads REQUIRED)

INCLUDE_DIRECTORIES(
${OPENAL_INCLUDE_DIR}
${GLFW_INCLUDE_DIR}
${GLEW_INCLUDE_DIR}
${LUA_INCLUDE_DIR}
${ZLIB_INCLUDE_DIR}
${PNG_INCLUDE_DIR}
${BULLET_INCLUDE_DIR}
${VORBIS_INCLUDE_DIR}
${OPENGL_INCLUDE_DIR}
)
# debug
message( "CMAKE_BUILD_TYPE: ${CMAKE_BUILD_TYPE}" )
if ( "${CMAKE_BUILD_TYPE}" STREQUAL "DEBUG" )
    add_definitions(-D_DEBUG)
endif()

# architecture
if ( CMAKE_SIZEOF_VOID_P EQUAL 8 )
set(ARCH_DIR "x64")
else()
set(ARCH_DIR "x86")
endif()

# gameplay library
add_subdirectory(gameplay)

# gameplay samples
add_subdirectory(samples)

# gameplay encoder
# A pre-compiled executable can be found in 'gameplay/bin'. Uncomment to build yourself.
#add_subdirectory(tools/encoder)
