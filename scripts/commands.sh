fst-compiler-utf8 keitairon.fst ../bin/lex.a && fst-print ../bin/lex.a > ../bin/debug/out.txt && perl ../scripts/fst2dot.pl ../bin/debug/out.txt | dot -Tsvg -o ../bin/debug/model.svg
fst-compiler-utf8 keitairon.fst ../bin/lex.a && fst-mor ../bin/lex.a