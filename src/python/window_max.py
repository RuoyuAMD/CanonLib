# !/usr/bin/python
# -*- coding: utf-8 -*-#

"""
window_max is a array peak solution model
"""

class ArrayWindow(object):
    """
    ArrayWindow(object) -> ArrayWindow class
    """
    OFFSET = 1
    FIRST = 0

    def __init__(self, array):
        if isinstance(array, list):
            self.array = array
        else:
            self.array = []
        self.window = []

    def set_array(self, array):
        """
        ArrayWindow(object) -> boolean
        set the window's array
        """
        if isinstance(array, list):
            self.array = array
            return True
        return False

    def get_window_max(self, window_size):
        """
        get_window_max(self,window_size,max_num_index,current_index) -> []
            The class will return the array's peak such as
            [4,3,5,4,3,3,6,7] when the window size = 3
            it will return [5,5,5,4,6,7]
            when len(array) = n, window size = w the len of result will be n-w+1.
        """
        result = self.get_windows_max(window_size, self.FIRST)
        if len(result) > len(self.array) - window_size + self.OFFSET:
            return result[-(len(self.array) - window_size + self.OFFSET):]
        else:
            return False

    def get_windows_max(self, window_size, current_index):
        """
        get_windows_max(self,window_size,max_num_index,current_index) -> []
            The class will return the array's peak such as
            [4,3,5,4,3,3,6,7] when the window size = 3
            it will return [4,3,5,5,5,4,6,7]
            when len(array) = n, window size = w the len of result will be n-w+1.
        """
        if self.window and current_index >= self.window[self.FIRST] + window_size:
            self.window = self.window[self.OFFSET:]
        self.window.reverse()
        for _ in self.window:
            if self.array[_] <= self.array[current_index]:
                self.window = self.window[self.OFFSET:]
        self.window.reverse()
        self.window.append(current_index)
        max_num = self.array[self.window[self.FIRST]]
        if current_index == len(self.array) - self.OFFSET:
            return [max_num]
        else:
            return [max_num] + self.get_windows_max(window_size, current_index + self.OFFSET)