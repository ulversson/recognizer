require 'rmagick'
CONVERT  = `which convert`.strip
PARAMS = "-type Grayscale -negate -define morphology:compose=darken -morphology Thinning 'Rectangle:1x80+0+0<' -negate "
input_item = ARGV[0]
output_item = ARGV[1]

def run_convert(img_path, output_path)
  `#{CONVERT} #{img_path} #{PARAMS} #{output_path}`
end

if File.directory? input_item 
  files = Dir.glob("#{input_item}/*.png").map(&File.method(:realpath))
  files.each do |file|
    run_convert(file, file)
  end  
else
  run_convert(input_item, output_item)
end  
exit(0)