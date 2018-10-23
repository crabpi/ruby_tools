def pbm2arr(file)
    File.open(file,"r") do |file|
        i = 0
        arr = []
        while line = file.gets   #标准输入流
            i +=1 
            if i > 3
                arr << line.chomp
            end
        end
        arr
    end
end