# !/usr/bin/env python
# -*- coding: utf-8 -*-#
"""
a module for conceptis build from qrcode
"""

from PIL import Image
from numpy import np

class Conceptis(object):
    """
    Conceptis class
    """
    QR_CODE = None

    def __init__(self):
        pass

    def set_qrcode(self, path):
        """
        set the conceptis's qrcode
        """
        self.QR_CODE = Image.open(path)

    def get_matrix(self):
        """
        get the image maxtri
        """
        if self.QR_CODE:
            width, height = self.QR_CODE.size
            im = self.QR_CODE.convert("L")
            data = im.getdata()
            data = np.matrix(data, dtype='float')/255.0
            new_data = np.reshape(data, (height, width))
            return new_data
        else:
            return False
