# !/usr/bin/python
# -*- coding: utf-8 -*-#
"""
program runner
"""

from window_max import ArrayWindow


if __name__ == '__main__':
    print  ArrayWindow(
        [1, 2, 7, 9, 6, 7, 4, 3, 3, 3, 3, 3, 3, 3, 3, 5, 4, 3, 3, 6, 7, 3]).get_window_max(5)
