
from PIL import Image 
import pytesseract 
import sys 
from pdf2image import convert_from_path 
import os 
input_dir = sys.argv[1]

for root, dirs, files in os.walk(os.path.abspath(input_dir)):
  for file in files:

    file_path = os.path.join(root, file)
    text_file_path = file_path.replace("png","txt")
    fileName,fileExtension = os.path.splitext(file_path)
    if (fileExtension.endswith(".png") or fileExtension.endswith(".jpg")):
      f = open(text_file_path, "a") 
      text = str(((pytesseract.image_to_string(Image.open(file_path))))) 
      text = text.replace('-\n', '')     
      f.write(text) 
      f.close() 