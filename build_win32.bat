rmdir /s /q build

for /D %%s in (mydemo*) do ( 
cmake -A Win32 -S ./%%s -B ./build/%%s
cmake --build ./build/%%s --clean-first  --config Release
cmake --install ./build/%%s --prefix ./build/install/%%s
)

pause