
from PIL import Image 
import pytesseract 
import sys 
from pdf2image import convert_from_path 
import os 
  
PDF_file = sys.argv[1]

pages = convert_from_path(PDF_file, 500)   
image_counter = 1  
for page in pages: 
    filename = "page_"+str(image_counter)+".jpg"
    page.save(filename, 'JPEG') 
    image_counter = image_counter + 1

# Variable to get count of total number of pages 
filelimit = image_counter-1  
for i in range(1, filelimit + 1): 
    f = open("page_"+str(i)+".txt", "a") 
    filename = "page_"+str(i)+".jpg"          
    text = str(((pytesseract.image_to_string(Image.open(filename))))) 
    text = text.replace('-\n', '')     
    f.write(text) 
    f.close() 
