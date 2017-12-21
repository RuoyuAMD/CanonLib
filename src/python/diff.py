# !/usr/bin/env python
# -*- coding: utf-8 -*-#

import sys

DEFAULT_SYS_ARGV_LEN = 3
HEP_SYS_ARGV_LEN = 2

class Diffiner(object):
    
    FIRST_SLICE = 1

    def __init__(self, ol, nl):
        self.old_list = ol
        self.new_file = nl

    def get_diff_array(self, ol, nl):
        for index_l, ol_line in enumerate(ol):
            for index_n, nl_line in enumerate(nl):
                if ol[self.FIRST_INDEX] == nl_line:
                    pair_count, pair_array = self.get_diff_array(ol[self.FIRST_SLICE:], nl[index_n + self.FIRST_SLICE])

            
    def get_diff(self):
        self.get_diff_array(self.old_list,self.new_file)
        return 1

if __name__ == '__main__':
    if len(sys.argv) == DEFAULT_SYS_ARGV_LEN:
        RESULT = []
        with open(sys.argv[1], 'r') as old_file:
            with open(sys.argv[2], 'r') as new_file:
                RESULT = Diffiner(old_file.readlines(), new_file.readlines()).get_diff()
        print RESULT
    elif len(sys.argv) == HEP_SYS_ARGV_LEN and sys.argv[1] == '-h':
        print 'diff.py <old_file_name> <new_file_name>'
    else:
        print '2 argv want,1 argv given'
        print 'diff.py <old_file_name> <new_file_name>'
        sys.exit(1)
    sys.exit(0)
