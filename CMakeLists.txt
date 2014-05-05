cmake_minimum_required(VERSION 2.6)

project(GamePlay)

set(GAMEPLAY_VERSION 2.0.0)
set(CMAKE_C_COMPILER_INIT g++)

# architecture
if ( CMAKE_SIZEOF_VOID_P EQUAL 8 )
set(ARCH_DIR "x64")
else()
set(ARCH_DIR "x86")
endif()

# Selecting the way dependencies are resolved, either pre-compiled ones, or using cmnake's find_package system.
option(USE_LOCAL_LIBRARIES "Use local libraries instead of pre-compiled package ?" OFF)

if(USE_LOCAL_LIBRARIES)
LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/CMakeScripts)
    find_package(OpenAL REQUIRED)
    find_package(GLEW REQUIRED)
    set(Lua_FIND_VERSION 2)
    find_package(Lua REQUIRED)
    find_package(Freetype REQUIRED)
    find_package(ZLIB REQUIRED)
    find_package(PNG REQUIRED)
    find_package(Bullet REQUIRED)
    find_package(Vorbis REQUIRED)
    find_package(OpenGL REQUIRED)
    find_package(Threads REQUIRED)
else()
    link_directories(
        ${CMAKE_SOURCE_DIR}/external-deps/lua/lib/linux/${ARCH_DIR}
        ${CMAKE_SOURCE_DIR}/external-deps/zlib/lib/linux/${ARCH_DIR}
        ${CMAKE_SOURCE_DIR}/external-deps/png/lib/linux/${ARCH_DIR}
        ${CMAKE_SOURCE_DIR}/external-deps/bullet/lib/linux/${ARCH_DIR}
        ${CMAKE_SOURCE_DIR}/external-deps/oggvorbis/lib/linux/${ARCH_DIR}
        ${CMAKE_SOURCE_DIR}/external-deps/openal/lib/linux/${ARCH_DIR}
        ${CMAKE_SOURCE_DIR}/external-deps/glew/lib/linux/${ARCH_DIR}
    )
    set(LUA_LIBRARIES lua m)
    set(PNG_LIBRARIES png)
    set(ZLIB_LIBRARIES z)
    set(VORBIS_LIBRARIES vorbis ogg)
    set(BULLET_LIBRARIES BulletDynamics BulletCollision LinearMath)
    set(OPENAL_LIBRARY openal)
    set(GLEW_LIBRARIES GLEW)
    set(OPENGL_LIBRARIES GL X11)
    set(CMAKE_THREADS_LIBS_INIT)

    set(OPENAL_INCLUDE_DIR external-deps/openal/include)
    set(GLEW_INCLUDE_DIR external-deps/glew/include)
    set(LUA_INCLUDE_DIR external-deps/lua/include)
    set(ZLIB_INCLUDE_DIR external-deps/zlib/include)
    set(PNG_INCLUDE_DIR external-deps/png/include)
    set(BULLET_INCLUDE_DIR external-deps/bullet/include)
    set(VORBIS_INCLUDE_DIR external-deps/oggvorbis/include)
    set(OPENGL_INCLUDE_DIR )
endif()

INCLUDE_DIRECTORIES(
${OPENAL_INCLUDE_DIR}
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

# gameplay library
add_subdirectory(gameplay)

# gameplay samples
add_subdirectory(samples)

# gameplay encoder
# A pre-compiled executable can be found in 'gameplay/bin'. Uncomment to build yourself.
#add_subdirectory(tools/encoder)
