
from PIL import Image 
import pytesseract 
import os 
import sys
import cv2
import re
import numpy as np

def rotate_image(mat, angle):
  height, width = mat.shape[:2] # image shape has 3 dimensions
  image_center = (width/2, height/2) # getRotationMatrix2D needs coordinates in reverse order (width, height) compared to shape
  rotation_mat = cv2.getRotationMatrix2D(image_center, angle, 1.)
  abs_cos = abs(rotation_mat[0,0]) 
  abs_sin = abs(rotation_mat[0,1])
  bound_w = int(height * abs_sin + width * abs_cos)
  bound_h = int(height * abs_cos + width * abs_sin)
  rotation_mat[0, 2] += bound_w/2 - image_center[0]
  rotation_mat[1, 2] += bound_h/2 - image_center[1]
  rotated_mat = cv2.warpAffine(mat, rotation_mat, (bound_w, bound_h))
  return rotated_mat

def rotate_and_save_image(input_image):
  try:
    im = cv2.imread(str(input_image), cv2.IMREAD_GRAYSCALE)
    newdata=pytesseract.image_to_osd(im)
    angle = re.search('(?<=Rotate: )\d+', newdata).group(0)
    print('Rotating image by '+ angle + ' degrees')
    if (int(angle) == 0):
      return

    rotated = rotate_image(im, int(angle))
    cv2.imwrite(input_image, rotated)
  except:
    return

input_image = sys.argv[1]
if os.path.isfile(input_image):  
  rotate_and_save_image(input_image)
else:
  for root, dirs, files in os.walk(os.path.abspath(input_image)):
    for file in files:
      print(file)
      file_path = os.path.join(root, file)
      rotate_and_save_image(file_path)