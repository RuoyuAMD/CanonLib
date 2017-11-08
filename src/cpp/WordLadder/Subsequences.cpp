#include <Subsequences.h>
#include <stdafx.h>
#include <iostream>  
#include <string>  
#include <cstdlib>  
#include <list>

using namespace std;

/*
leetcode原地址：https://leetcode.com/problems/distinct-subsequences/
原题：
Given a string S and a string T, count the number of distinct subsequences of T in S.

A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ACE" is a subsequence of "ABCDE" while "AEC" is not).

Here is an example:
S = "rabbbit", T = "rabbit"

Return 3.

Subscribe to see which companies asked this question
*/

//方法2，树形逆向相加  
int Subsequences::Subsequences(string s,string t){
    using namespace std;
    typedef list<int> datastack;  

    //声明三个堆栈，两个用于存放数据串，一个用于分组标记，即子串数量即为组数  
    datastack data1,data2,group;  
    int int_son = 0;  
      
    //当子串长度为1时  
    if (t.size()>1)  
    {  
          
        //计算组数，以及每组中每个字符串在母串中同下一个字符拥有等序位的数目  
        for (int i = 0; i < t.length()-1; i++){  
            int int_group = 0;  
            for (int j = 0; j < s.length(); j++){  
                if (t[i] == s[j]){  
                    int_group++;  
                    int enequal = 0;  
                    for (int m = j+1; m < s.length(); m++){  
                        if (t[i + 1] == s[m]){  
                            enequal++;  
                        }  
                    }  
                    data1.push_back(enequal);  
                }  
            }  
            group.push_back(int_group);  
        }  
          
        //当组数大于1时  
        while (group.size()>1){  
            int dataL = group.back();  
            group.pop_back();  
            int dataF = group.back();  
            group.pop_back();  
              
            //在内存中位两组数据动态分配存储空间，存入一个数组当中  
            int * cacheL = (int *)malloc(dataL * sizeof(int));  
            int * cacheF = (int *)malloc(dataF * sizeof(int));  
            for (int i = 0; i < dataL; i++){  
                *(cacheL+i) = data1.back();  
                data1.pop_back();  
            }  
            for (int i = 0; i < dataF; i++){  
                *(cacheF+i) = data1.back();  
                data1.pop_back();  
            }  
              
            //对比数组中的数据，将后组位置比前组数组中保存数字小的数据相加放入第二堆栈中  
            for (int i = 0; i < dataF; i++){  
                int cache = 0;  
                for (int j = 0; j < *(cacheF + i); j++){  
                    cache += *(cacheL+ j);  
                }  
                data2.push_back(cache);  
            }  
              
            //销毁内存分配防止内存溢出  
            free(cacheL);  
            free(cacheF);  
      
            //将堆栈2中的数据统计压入，分组堆栈  
            group.push_back(data2.size());  
              
            //将第二堆栈中的数据再次放入堆栈一种  
            while (data2.size()>0)  
            {  
                data1.push_back(data2.back());  
                data2.pop_back();  
            }  
              
            //当组仅剩一组时，全部相加  
            while (group.size() == 1)  
            {  
                while (data1.size() > 0)  
                {  
                    int_son += data1.back();  
                    data1.pop_back();  
                }  
                group.pop_back();  
            }  
        }  
          
        //若只有一组分组，则直接全部相加  
        while (group.size()==1)  
        {  
            while (data1.size()>0)  
            {  
                int_son += data1.back();  
                data1.pop_back();  
            }  
            group.pop_back();  
        }  
    }  
      
    //若子串仅有一个字符则对比相同的字符全部相加  
    else  
    {  
        for (int i = 0; i < s.length();i++)  
        {  
            if (s[i] == t[0]){  
                int_son++;  
            }  
        }  
    }  
    return int_son;  
}  