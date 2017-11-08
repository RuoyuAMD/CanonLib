#pragma once


class SHA1
{
private:
	static unsigned int temp;
	static unsigned int H[5];
	static unsigned int A, B, C, D, E;
	static unsigned int W[80];
	static unsigned int K[4];

	static unsigned int F1(unsigned int FB, unsigned int FC, unsigned int FD);
	static unsigned int F2(unsigned int FB, unsigned int FC, unsigned int FD);
	static unsigned int F3(unsigned int FB, unsigned int FC, unsigned int FD);
	static unsigned int F4(unsigned int FB, unsigned int FC, unsigned int FD);
	static unsigned int F5(unsigned int W1, unsigned int W2, unsigned int W3, unsigned int  W4);

	static unsigned int Kt(int t);

	static unsigned int Ft(unsigned int FB, unsigned int FC, unsigned int FD, int t);

	static unsigned int Sn(unsigned int un_int, int n);

	static void WChang(int n_index,int n_offset);

	static void* End_Chang(void* ptr,int type_size);

public:
	SHA1();
	~SHA1();

	static unsigned char* HASH(unsigned char* data,long data_size);
	static void Init(void);
};

