from PIL import Image 
import pytesseract 
import sys 
from pdf2image import convert_from_path 
import os 

PDF_file = sys.argv[1]
outdir = sys.argv[2]

pages = convert_from_path(PDF_file, 500)   
image_counter = 1  
for page in pages: 
  filename = "page_"+str(image_counter)+".jpg"
  page.save(os.path.join(outdir,filename), 'JPEG') 
  image_counter = image_counter + 1

print(image_counter-1)