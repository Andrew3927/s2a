C_SRC       = lex.c expr.c error.c decl.c stmt.c main.c emit.c func.c
H_SRC			= lex.h expr.h error.h decl.h stmt.h tokens.txt emit.h func.h

Exams:=$(shell find ./ -name "Exam*.c")

all:  
	gcc -static -o SourceCodeComplier $(C_SRC)
	./SourceCodeComplier < demo.c	> demo.s
	gcc -m32 demo.s -o demo

run:
	./demo 2022 11 12 17 35


runexams:
	make -C examples
	make -C examples run	

clean:
	rm -f *.o sc demo *.s
	make -C examples clean
	

