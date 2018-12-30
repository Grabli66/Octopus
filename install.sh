cd ./Libs/Modest
make
cd ../..
make -j2 -e -f Octopus.mk clean
make -j2 -e -f Octopus.mk all
sudo cp ./Debug/octopus.hdll /usr/lib/octopus.hdll