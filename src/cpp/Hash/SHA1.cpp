#include "SHA1.h"

unsigned int SHA1::temp = 0;
unsigned int SHA1::H[5] = { 0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xC3D2E1F0 };
unsigned int SHA1::K[4] = { 0x5A827999, 0x6ED9EBA1, 0x8F1BBCDC, 0xCA62C1D6 };
unsigned int SHA1::A = 0;
unsigned int SHA1::B = 0;
unsigned int SHA1::C = 0;
unsigned int SHA1::D = 0;
unsigned int SHA1::E = 0;
unsigned int SHA1::W[80] = {0};

SHA1::SHA1()
{
	Init();
}

SHA1::~SHA1()
{
}

void SHA1::Init(void)
{
	temp = 0;
	H[0] = 0x67452301, H[1] = 0xEFCDAB89, H[2] = 0x98BADCFE, H[3] = 0x10325476, H[4] = 0xC3D2E1F0;
	K[0] = 0x5A827999, K[1] = 0x6ED9EBA1, K[2] = 0x8F1BBCDC, K[3] = 0xCA62C1D6;
	A = 0, B = 0, C = 0, D = 0, E = 0;
	memset(W, 0, 80 * sizeof(unsigned int*));
}


unsigned int SHA1::F1(unsigned int FB, unsigned int FC, unsigned int FD)
{
	return (FB & FC) | ((~FB) & FD);
}
unsigned int SHA1::F2(unsigned int FB, unsigned int FC, unsigned int FD)
{
	return FB ^ FC ^ FD;
}
unsigned int SHA1::F3(unsigned int FB, unsigned int FC, unsigned int FD)
{
	return (FB & FC) | (FB & FD) | (FC & FD);
}
unsigned int SHA1::F4(unsigned int FB, unsigned int FC, unsigned int FD)
{
	return FB ^ FC ^ FD;
}
unsigned int SHA1::F5(unsigned int W1, unsigned int W2, unsigned int W3, unsigned int  W4)
{
	return W1 ^ W2 ^ W3 ^ W4;
}


unsigned int SHA1::Kt(int t)
{
	if (t >= 0 && t <= 19)
	{
		return K[0];
	}
	else if (t >= 20 && t <= 39)
	{
		return K[1];
	}
	else if (t >= 40 && t <= 59)
	{
		return K[2];
	}
	else if (t >= 60 && t <= 79)
	{
		return K[3];
	}
	return 0;
}


unsigned int SHA1::Ft(unsigned int FB, unsigned int FC, unsigned int FD, int t)
{
	if (t >= 0 && t <= 19)
	{
		return F1(FB, FC, FD);
	}
	else if (t >= 20 && t <= 39)
	{
		return F2(FB, FC, FD);
	}
	else if (t >= 40 && t <= 59)
	{
		return F3(FB, FC, FD);
	}
	else if (t >= 60 && t <= 79)
	{
		return F4(FB, FC, FD);
	}
	return 0;
}

unsigned int SHA1::Sn(unsigned int un_int, int n)
{
	unsigned int result;
	unsigned int result_temp;
	if (n >= 0)
	{
		result_temp = un_int >> (32 - n % 32);
		result = un_int << n % 32;
		result = result | result_temp;
	}
	else
	{
		n = -n;
		result_temp = un_int << (32 - n);
		result = un_int >> n % 32;
		result = result | result_temp;
	}
	return result;
}
void SHA1::WChang(int n_index, int n_offset)
{
	for (int i = n_index; i <= n_offset; i++)
	{
		End_Chang(&W[i],sizeof(unsigned int));
	}
}

void*SHA1::End_Chang(void* ptr, int type_size)
{
	char *ptr_copy = new char[8];
	memcpy(ptr_copy, ptr, type_size);
	char temp;
	for (int i = 0; i < type_size / 2; i++)
	{
		temp = ptr_copy[i];
		ptr_copy[i] = ptr_copy[type_size - 1 - i];
		ptr_copy[type_size - 1 - i] = temp;
	}
	memcpy(ptr, ptr_copy, type_size);
	delete[] ptr_copy;
	return ptr;
}

unsigned char* SHA1::HASH(unsigned char* data,long data_size)
{
	Init();
	long trunk_count = ((data_size + 8) / 64) + 1;
	unsigned char* data_add = new unsigned char[trunk_count * 64];
	memset(data_add, 0, trunk_count * 64);
	memcpy(data_add, data, data_size);
	memset(data_add + data_size, 0x80, 1);
	unsigned int bit_count = data_size * 8;
	//memset(data_add + trunk_count * 64 - 1, data_size * 8, 1);
	unsigned char* data_size_address = (unsigned char*)&bit_count;
	int long_size = sizeof(long);
	int uchar_size = sizeof(unsigned char);
	int copy_count = long_size / uchar_size;

	for (int i = 0; i < copy_count; i++)
		memcpy(data_add + trunk_count * 64 - 1 - i, data_size_address + i, sizeof(unsigned char));
	delete[] data;
	for (int i = 0; i < trunk_count; i++)
	{
		memcpy(W, data_add + i * 64, 16 * sizeof(unsigned int));
		WChang(0, 15);
		for (int t = 16; t < 80; t++)
		{
			W[t] = F5(W[t - 3], W[t - 8], W[t - 14], W[t - 16]);
			W[t] = Sn(W[t], 1);
		}
		A = H[0];
		B = H[1];
		C = H[2];
		D = H[3];
		E = H[4];
		for (int t = 0; t < 80; t++)
		{
			temp = Sn(A, 5) + Ft(B, C, D, t) + E + W[t] + Kt(t);
			E = D;
			D = C;
			C = Sn(B, 30);
			B = A;
			A = temp;
		}
		H[0] = H[0] + A;
		H[1] = H[1] + B;
		H[2] = H[2] + C;
		H[3] = H[3] + D;
		H[4] = H[4] + E;
	}
	delete[] data_add;
	unsigned char* result = new unsigned char[20];
	memcpy(result, H, 20 * sizeof(unsigned char));
	return result;
}
