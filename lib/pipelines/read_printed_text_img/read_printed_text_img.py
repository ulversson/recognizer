
from PIL import Image 
import pytesseract 
import sys 
import os 
  
IMG_file = sys.argv[1]
f = open(IMG_file+".txt", "a") 
text = str(((pytesseract.image_to_string(Image.open(IMG_file))))) 
text = text.replace('-\n', '')     
f.write(text) 
f.close() 