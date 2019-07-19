
from PIL import Image 
import pytesseract 
import sys 
import os 
  
IMG_file = sys.argv[1]
output = IMG_file+".txt"
f = open(output, "a") 
text = str(((pytesseract.image_to_string(Image.open(IMG_file))))) 
text = text.replace('-\n', '')     
f.write(text) 
f.close() 
print(output)