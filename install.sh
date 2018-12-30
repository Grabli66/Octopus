make -j2 -e -f Octopus.mk clean
make -j2 -e -f Octopus.mk all
cp ./Debug/octopus.hdll /usr/lib/octopus.hdll