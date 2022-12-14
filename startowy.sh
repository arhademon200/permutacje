#!/bin/bash



































x=$(wc -l < okroskbash/output.txt)
nazwa=`cat okroskbash/zmienna.txt`
#rm okroskbash/output.txt okroskbash/input.txt
echo "\documentclass{article}" >> $nazwa.tex
echo "\usepackage[utf8]{inputenc}" >> $nazwa.tex
echo "\usepackage[polish]{babel}" >> $nazwa.tex
echo "\usepackage[T1]{fontenc}" >> $nazwa.tex
echo -n "\title{Permutacje zbioru " >> $nazwa.tex
cat okroskbash/permutacja_1.txt | tr '\n' ' ' >> $nazwa.tex
echo "}" >> $nazwa.tex
echo "\date{}" >> $nazwa.tex

echo "\begin{document}" >> $nazwa.tex

echo "\maketitle" >> $nazwa.tex

for ((i=1;i<2;i++))
do
	y=$(($i + 1))
	echo -n "\section{Bieżąca permutacja: "  >> $nazwa.tex
    cat okroskbash/permutacja_1.txt | tr '\n' ' ' >> $nazwa.tex
    echo "}" >> $nazwa.tex
   cat okroskbash/input.txt > okroskbash/parzystosc_input.txt
   cat okroskbash/permutacja_1.txt >> okroskbash/parzystosc_input.txt
    ./okroskbash/parzystosc < okroskbash/parzystosc_input.txt > okroskbash/parzystosc_output.txt
    ./okroskbash/kwadrat_permutacji < okroskbash/parzystosc_input.txt > okroskbash/kwadrat_output.txt
    echo "Kwadrat permutacji: " >> $nazwa.tex
    cat okroskbash/kwadrat_output.txt >> $nazwa.tex
    echo '\\Parzystość: ' >> $nazwa.tex
    cat okroskbash/parzystosc_output.txt >> $nazwa.tex
    DRUGA=okroskbash/permutacja_2.txt
    test -f "okroskbash/permutacja_2.txt"
    if (echo $? = 0); then
        echo -n "Następna permutacja: "  >> $nazwa.tex
        cat okroskbash/permutacja_2.txt >> $nazwa.tex
    fi
done

for ((h=2;h<x;h++))
do
   echo $h > okroskbash/h.txt
   cat okroskbash/input.txt > okroskbash/parzystosc_input.txt
   cat okroskbash/permutacja_$h.txt >> okroskbash/parzystosc_input.txt
   y=$(($h + 1))
   z=$(($h - 1))
    echo -n "\section{Bieżąca permutacja: "  >> $nazwa.tex
    cat okroskbash/permutacja_$h.txt | tr '\n' ' ' >> $nazwa.tex
    echo "}" >> $nazwa.tex
    echo "Poprzednia permutacja: " >> $nazwa.tex
    cat okroskbash/permutacja_$z.txt | tr '\n' ' ' >> $nazwa.tex
    echo "\\\\Zapis w dwóch liniach:" >> $nazwa.tex
    echo '\begin{large}' >> $nazwa.tex
    echo '${' >> $nazwa.tex
    cat okroskbash/permutacja_1.txt | tr '\n' ' ' >> $nazwa.tex
    echo -n '\choose' >> $nazwa.tex
    cat okroskbash/permutacja_$h.txt | tr '\n' ' ' >> $nazwa.tex
    echo -n '}$' >> $nazwa.tex
    echo '\end{large}\\' >> $nazwa.tex
    ./okroskbash/parzystosc < okroskbash/parzystosc_input.txt > okroskbash/parzystosc_output.txt
    ./okroskbash/kwadrat_permutacji < okroskbash/parzystosc_input.txt > okroskbash/kwadrat_output.txt
    echo "Kwadrat permutacji: " >> $nazwa.tex
    cat okroskbash/kwadrat_output.txt >> $nazwa.tex
    echo '\\Parzystość: ' >> $nazwa.tex
    cat okroskbash/parzystosc_output.txt >> $nazwa.tex
    echo -n "Następna permutacja: "  >> $nazwa.tex
    cat okroskbash/permutacja_$y.txt >> $nazwa.tex
done

p=$(($x - 1))
echo -n "\section{Bieżąca permutacja: "  >> $nazwa.tex
cat okroskbash/permutacja_$x.txt | tr '\n' ' ' >> $nazwa.tex
echo "}" >> $nazwa.tex
echo "Poprzednia permutacja: " >> $nazwa.tex
cat okroskbash/permutacja_$p.txt | tr '\n' ' ' >> $nazwa.tex
echo -e "\n" >> $nazwa.tex
echo "Zapis w dwóch liniach:" >> $nazwa.tex
echo '\begin{large}' >> $nazwa.tex
echo '${' >> $nazwa.tex
cat okroskbash/permutacja_1.txt | tr '\n' ' ' >> $nazwa.tex
echo -n '\choose' >> $nazwa.tex
cat okroskbash/permutacja_$x.txt | tr '\n' ' ' >> $nazwa.tex
echo -n '}$' >> $nazwa.tex
echo '\end{large}\\' >> $nazwa.tex
cat okroskbash/input.txt > okroskbash/parzystosc_input.txt
cat okroskbash/permutacja_$x.txt >> okroskbash/parzystosc_input.txt
echo "Kwadrat permutacji: " >> $nazwa.tex
./okroskbash/kwadrat_permutacji < okroskbash/parzystosc_input.txt > okroskbash/kwadrat_output.txt
./okroskbash/parzystosc < okroskbash/parzystosc_input.txt > okroskbash/parzystosc_output.txt
cat okroskbash/kwadrat_output.txt >> $nazwa.tex
echo '\\Parzystość: ' >> $nazwa.tex
cat okroskbash/parzystosc_output.txt >> $nazwa.tex

echo -e "\n" >> $nazwa.tex
echo "\end{document}" >> $nazwa.tex

pdflatex $nazwa.tex
rm $nazwa.log $nazwa.aux
rm -r okroskbash
