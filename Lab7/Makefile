run7_5: clean Lab7_5
	./Lab7_5
Lab7_5: Lab7_5.s
	gcc -o Lab7_5 Lab7_5.s

run7_4: clean Lab7_4
	./Lab7_4
Lab7_4: Lab7_4.s
	gcc -o Lab7_4 Lab7_4.s

run7_3_1: clean Lab7_3_1
	./Lab7_3_1
Lab7_3_1: Lab7_3_1.s
	as -o Lab7_3_1.o Lab7_3_1.s
	gcc -o Lab7_3_1 Lab7_3_1.o

run7_3: clean Lab7_3
	./Lab7_3
Lab7_3: Lab7_3.s
	as -o Lab7_3.o Lab7_3.s
	gcc -o Lab7_3 Lab7_3.o

run7_2: clean Lab7_2
	./Lab7_2
Lab7_2: Lab7_2.s
	as -o Lab7_2.o Lab7_2.s
	gcc -o Lab7_2 Lab7_2.o

Lab7_1: Lab7_1.s Lab7_1.o
	gcc -o Lab7_1 Lab7_1.o
	as -o Lab7_1.o Lab7_1.s

clean:
	rm -f Lab7_*.o Lab7_1 Lab7_2 Lab7_3 Lab7_3_1 Lab7_4


