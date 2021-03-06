#!/usr/bin/env bash
# compile LaTex document
# author: Lozada-Blanco Asdrubal


file=$1  # master tex file
book=$2  # bib file

#clear
rm $file.aux $file.bbl $file.blg
rm $file.loc $file.lof $file.log
rm $file.lot $file.nlo $file.out
rm $file.pdf $file.soc $file.toc
#
echo 'compiling ...'
#
pdflatex $file
# compile nomenclature section
makeindex $file.nlo -s nomencl.ist -o $file.nls
echo 'compile nomenclatures [Lista de abreviaturas]'
pdflatex $file
pdflatex $file
# compile bibtex
bibtex $file
bibtex $book
echo 'compile bibliography [ReferĂȘncias bibliograficas]'
pdflatex $file
pdflatex $file
echo 'compile master document tex [Documento principal]'
# copy 
#$file.pdf tese.pdf
echo 'making pdf document [Documento final]'

date
