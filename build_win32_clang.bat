set runpath=%cd%

rmdir /s /q build

for /D %%s in (mydemo*) do ( 
cmake -DUSEMYPRINT=1 -A Win32 -T ClangCL -S ./%%s -B ./build/%%s
cmake --build ./build/%%s --clean-first --config Release --target ALL_BUILD

cd ./build/%%s
ctest --force-new-ctest-process -C Release
cmake --install ./ --prefix %runpath%/build/install/%%s
cpack -C Release --config CPackSourceConfig.cmake -B %runpath%/build/package/source/%%s
cpack -C Release --config CPackConfig.cmake -B %runpath%/build/package/%%s
cd %runpath%
)

pause