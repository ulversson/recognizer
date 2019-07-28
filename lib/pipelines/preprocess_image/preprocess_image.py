import numpy as np
import cv2
import sys
import os
input_item = sys.argv[1]


def binarize(input_item):
  img = cv2.imread(input_item, cv2.IMREAD_GRAYSCALE)
  pxmin = np.min(img)
  pxmax = np.max(img)
  imgContrast = (img - pxmin) / (pxmax - pxmin) * 255
  kernel = np.ones((3, 3), np.uint8)
  imgMorph = cv2.erode(imgContrast, kernel, iterations = 1)
  return imgMorph

if os.path.isfile(input_item):  
  imgMorph  = binarize(input_item)
  cv2.imwrite(input_item, imgMorph)
  print(input_item)
else:
  for root, dirs, files in os.walk(os.path.abspath("./out")):
    for file in files:
        print(file)
        file_path = os.path.join(root, file)
        imgMorph  = binarize(file_path)
        cv2.imwrite(file_path, imgMorph)
    else:
      continue

