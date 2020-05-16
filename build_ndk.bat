set runpath=%cd%

rmdir /s /q build

for /D %%s in (mydemo*) do ( 
cmake -G "Unix Makefiles" -DUSEMYPRINT=1 -S ./%%s -B ./build/%%s ^
-DCMAKE_TOOLCHAIN_FILE="%ANDROID_NDK_HOME%\build\cmake\android.toolchain.cmake" ^
-DANDROID_NDK="%ANDROID_NDK_HOME%" ^
-DCMAKE_BUILD_TYPE=Release ^
-DANDROID_ABI="armeabi-v7a" ^
-DCMAKE_MAKE_PROGRAM="%ANDROID_NDK_HOME%\prebuilt\windows-x86_64\bin\make.exe" ..
cmake --build ./build/%%s --clean-first --config Release --target all

cd ./build/%%s
ctest --force-new-ctest-process -C Release
cmake --install ./ --prefix %runpath%/build/install/%%s --config Release
cpack -C Release --config CPackSourceConfig.cmake -B %runpath%/build/package/source/%%s
cpack -C Release --config CPackConfig.cmake -B %runpath%/build/package/%%s
cd %runpath%
)

pause