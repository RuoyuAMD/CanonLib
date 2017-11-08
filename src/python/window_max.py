# !/usr/bin/python -*- coding: utf-8 -*-#
"""
window_max is a array peak solution model
"""

class ArrayWindow(object):
    """
    ArrayWindow(object) -> ArrayWindow class
    """

    def __init__(self, array):
        if isinstance(array, list):
            self.array = array
        else:
            self.array = []

    def set_array(self, array):
        """
        ArrayWindow(object) -> boolean
        set the window's array
        """
        if isinstance(array, list):
            self.array = array
            return True
        return False


    def get_window_max(self, window_size, max_num_index, current_index):
        """
        get_window_max(self,window_size,max_num_index,current_index) -> []
            The class will return the array's peak such as
            [4,3,5,4,3,3,6,7] when the window size = 3
            it will return [4,3,5,5,5,4,6,7]
            when len(array) = n, window size = w the len of result will be n-w+1.
        """
        result = []
        if not (isinstance(window_size, int)
                and isinstance(max_num_index, int)
                and isinstance(current_index, int)):
            return result
        if not self.array or window_size < 0 or max_num_index < 0 or current_index < 0:
            return result
        if window_size == 0:
            return self.array
        max_tmp = self.array[max_num_index]
        next_max_num_index = None
        next_max_num = None
        target_index = len(self.array) >= (window_size + max_num_index) and (window_size + max_num_index) or len(self.array) 
        for i in range(current_index, target_index):
            if (next_max_num_index and next_max_num) is None:
                next_max_num_index = i
                next_max_num = self.array[i]
            else:
                if next_max_num <= self.array[i]:
                    next_max_num_index = i
                    next_max_num = self.array[i]
            if next_max_num <= max_tmp and current_index != max_num_index:
                result.append(max_tmp)
            else:
                result.append(next_max_num)
        if target_index == len(self.array):
            return result
        result = result + self.get_window_max(window_size, next_max_num_index,
                                              window_size + max_num_index)
        return result

    def get_window_maxs(self, window_size, max_num_index, current_index):
        
        """
        get_window_max(self,window_size,max_num_index,current_index) -> []
            The class will return the array's peak such as
            [4,3,5,4,3,3,6,7] when the window size = 3
            it will return [5,5,5,4,6,7]
            when len(array) = n, window size = w the len of result will be n-w+1.
        """

        result = self.get_window_max(window_size, max_num_index, current_index)
        if len(result) > len(self.array) - window_size + 1:
            return result[-(len(self.array) - window_size + 1):]
        else:
            return False


if __name__ == '__main__':
    print  ArrayWindow([1,2,7,9,6,7,4,3,5,4,3,3,6,7,3]).get_window_maxs(5,0,0)
