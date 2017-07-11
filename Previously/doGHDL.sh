#/bin/sh

#nome do TestBench
fileName="tb_gen"


#extensao do arquivo -> Nao usada
ext=".vhdl"

ghdl -a *.vhdl
ghdl -e $fileName
./$fileName --stop-time=3660ns --wave=$fileName.ghw
rm $fileName
rm *.o
rm work-obj*.cf
#rm *.vhdl~
