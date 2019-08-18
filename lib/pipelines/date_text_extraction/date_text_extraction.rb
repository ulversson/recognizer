require_relative "./date_extractor.rb"

if File.directory?(ARGV[0]) || File.extname(ARGV[0]) == ""
  input_file = ARGV[0] 
else
  input_file = ARGV[0]+".txt" 
end


def extract_dates(input_file)
  return if input_file.nil?
  matched_lines_with_dates = []
  File.readlines(input_file, encoding: 'UTF-8').each do |line|
    line = line.encode!('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
    date_extractor = DateExtractor.new(line)
    matched_lines_with_dates << date_extractor.extract! if date_extractor.found_date?
  end  
  pp matched_lines_with_dates.compact.join(",")
end

if File.directory? input_file 
  files = Dir.glob("#{input_file}/*.txt").map(&File.method(:realpath))
  files.each do |file|
    extract_dates(file)
  end  
else
  extract_dates(input_file)
end  
exit(0)
