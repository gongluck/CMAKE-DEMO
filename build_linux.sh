#!/bin/bash
runpath=$(pwd)

rm ./build -rf
mkdir ./build

for f in mydemo*
    do
	if [ -d $f ]; then
		mkdir ./build/$f
		cmake -G 'Unix Makefiles' -DUSEMYPRINT=1 -S ./$f -B ./build/$f
		cmake --build ./build/$f --clean-first --config Release --target all -v

		cd ./build/$f
		ctest --force-new-ctest-process -C Release
		cmake --install ./ --prefix $runpath/build/install/$f --config Release -v
		cpack -C Release --config CPackSourceConfig.cmake -B $runpath/build/package/source/$f
		cpack -C Release --config CPackConfig.cmake -B $runpath/build/package/$f
		cd $runpath
        fi   
done
