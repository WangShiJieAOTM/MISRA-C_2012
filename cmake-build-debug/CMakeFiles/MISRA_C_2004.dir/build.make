# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/d/NoteBook/MISRA-C_2012

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/d/NoteBook/MISRA-C_2012/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/MISRA_C_2004.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/MISRA_C_2004.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/MISRA_C_2004.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MISRA_C_2004.dir/flags.make

CMakeFiles/MISRA_C_2004.dir/main.c.o: CMakeFiles/MISRA_C_2004.dir/flags.make
CMakeFiles/MISRA_C_2004.dir/main.c.o: ../main.c
CMakeFiles/MISRA_C_2004.dir/main.c.o: CMakeFiles/MISRA_C_2004.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/d/NoteBook/MISRA-C_2012/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/MISRA_C_2004.dir/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/MISRA_C_2004.dir/main.c.o -MF CMakeFiles/MISRA_C_2004.dir/main.c.o.d -o CMakeFiles/MISRA_C_2004.dir/main.c.o -c /mnt/d/NoteBook/MISRA-C_2012/main.c

CMakeFiles/MISRA_C_2004.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MISRA_C_2004.dir/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /mnt/d/NoteBook/MISRA-C_2012/main.c > CMakeFiles/MISRA_C_2004.dir/main.c.i

CMakeFiles/MISRA_C_2004.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MISRA_C_2004.dir/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /mnt/d/NoteBook/MISRA-C_2012/main.c -o CMakeFiles/MISRA_C_2004.dir/main.c.s

# Object files for target MISRA_C_2004
MISRA_C_2004_OBJECTS = \
"CMakeFiles/MISRA_C_2004.dir/main.c.o"

# External object files for target MISRA_C_2004
MISRA_C_2004_EXTERNAL_OBJECTS =

MISRA_C_2004: CMakeFiles/MISRA_C_2004.dir/main.c.o
MISRA_C_2004: CMakeFiles/MISRA_C_2004.dir/build.make
MISRA_C_2004: CMakeFiles/MISRA_C_2004.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/d/NoteBook/MISRA-C_2012/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable MISRA_C_2004"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MISRA_C_2004.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MISRA_C_2004.dir/build: MISRA_C_2004
.PHONY : CMakeFiles/MISRA_C_2004.dir/build

CMakeFiles/MISRA_C_2004.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MISRA_C_2004.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MISRA_C_2004.dir/clean

CMakeFiles/MISRA_C_2004.dir/depend:
	cd /mnt/d/NoteBook/MISRA-C_2012/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/d/NoteBook/MISRA-C_2012 /mnt/d/NoteBook/MISRA-C_2012 /mnt/d/NoteBook/MISRA-C_2012/cmake-build-debug /mnt/d/NoteBook/MISRA-C_2012/cmake-build-debug /mnt/d/NoteBook/MISRA-C_2012/cmake-build-debug/CMakeFiles/MISRA_C_2004.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MISRA_C_2004.dir/depend

