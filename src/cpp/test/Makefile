build : hw2.o solution.o
	# clang -o build hw2.o solution.o #注意前面必须是tab，不能是空格
3 hw2.o : hw2.cpp solution.h
	# clang -g -c hw2.cpp
5 solution.o : solution.h solution.cpp
	# clang -g -c solution.cpp
7 clean :
	# rm hw2.o solution.o build