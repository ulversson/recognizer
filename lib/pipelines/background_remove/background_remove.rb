require 'rmagick'
CONVERT  = `which convert`.strip
PARAMS = "-type Grayscale -negate -define morphology:compose=darken -morphology Thinning 'Rectangle:1x80+0+0<' -negate "
def run_convert(img_path, output_path)
  `#{CONVERT} #{img_path} #{PARAMS} #{output_path}`
end
run_convert(ARGV[0], ARGV[1])
exit(0)