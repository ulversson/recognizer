module Pipeline
  module FileHelper

    def basename(uploaded_item)
      filename = uploaded_item.file.filename.to_s
      File.basename filename, File.extname(filename)
    end  
      
    def output_dir(uploaded_item)
      "/tmp/#{basename(uploaded_item)}"
    end
      
    def files_by_extension(uploaded_item, extension)
      Dir.glob("#{output_dir(uploaded_item)}/*.#{extension}").map(&File.method(:realpath))
    end  

    def text_file_name(uploaded_item)
      File.basename(uploaded_item.file.filename.to_s).gsub(/png|jpg/, "txt")
    end

    def text_file(path)
      File.basename(path).gsub(/png|jpg/, "txt")
    end

  end  
end  
