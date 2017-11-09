# !/usr/bin/python3.4# -*- coding: utf-8 -*-#
from window_max import ArrayWindow


if __name__ == '__main__':
    # print  ArrayWindow([1,2,7,9,6,7,4,3,5,4,3,3,6,7,3]).get_window_maxs(5,0,0)
    # a = [1,2]
    # c = a.insert(0,0)
    # print c

    #print  ArrayWindow([1,2,7,9,6,7,4,3,3,3,3,3,3,3,3,5,4,3,3,6,7,3]).get_window_max(5)
    a = [1,2,7,9,9,9,9,9,7,7,5,5,6,7,7]
    print hex(id(a))
    a.append(1)
    print hex(id(a))
    a.reverse()
    print hex(id(a))


