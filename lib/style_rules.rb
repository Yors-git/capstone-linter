class Rules
  attr_accessor :numOfErr

  def initialize
    @numOfErr = 0
  end
  
  def semicolons(lines)
    lines.each_with_index do |x, i|
      if x.end_with?(";\n") || x.end_with?("{\n") || x.end_with?("}\n") || x == "\n" || x.include?('//')
        next
      else 
        puts "Missing semicolon in line #{i+1}"
        @numOfErr += 1
      end
    end
  end

  def space_around_operators(lines)
    lines.each_with_index do |x, i|
      x_arr = x.split("")
      x_arr.each_with_index do |item, j| 
        if (item =~ /[\+\-\*\=\%\<\>]/).is_a?(Integer) && 
          (x_arr[j-1] =~ /\S/).is_a?(Integer) &&
          (x_arr[j-1] =~ /[\+\-\*\=\%\<\>]/) == nil
          puts "Missing space before #{item} sign in line #{i+1} column #{j+1}"
          @numOfErr += 1
        elsif (item =~ /[\+\-\*\=\%\<\>]/).is_a?(Integer) &&
          (x_arr[j+1] =~ /\S/).is_a?(Integer) &&
          (x_arr[j+1] =~ /[\+\-\*\=\%\<\>]/) == nil
          puts "Missing space after #{item} sign in line #{i+1} column #{j+2}"
          @numOfErr += 1
        end
      end
    end
  end

  def camel_case_var(lines)
    lines.each_with_index do |x, i|
      case x 
      when /const/
        if !((x[(x.index('const') + 6)] =~ /[A-Z]/) == nil)
          puts "Variables should not start with uppercase, check line #{i+1}"
          @numOfErr += 1
        end
      when /let/
        if !((x[(x.index('let') + 4)] =~ /[A-Z]/) == nil)
          puts "Variables should not start with uppercase, check line #{i+1}"
          @numOfErr += 1
        end
      when /var/
        if !((x[(x.index('var') + 4)] =~ /[A-Z]/) == nil)
          puts "Variables should not start with uppercase, check line #{i+1}"
          @numOfErr += 1
        end
      end 
    end
  end

  def indentation(lines)
    opened = 0
    lines.each_with_index do |x, i|
      if x.end_with?("{\n")
        opened += 1
        puts x
        puts lines[i+opened].index(/\s/) == 3
        puts lines[i+opened].index(/\S/) == 4
        puts lines[i+opened]
        # puts lines[i+opened][0] == " "
        # puts lines[i+opened][1] == " "
        # puts lines[i+opened][2] == " "
        # puts lines[i+opened][3] == " "
        # puts lines[i+opened][4] == " "
        puts opened 
      # elsif x.start_with?("}")
      #   opened -= 1
        # puts x
        # puts lines[i+1]
        # x_arr = x[i+1].split("")
        # x_arr.each_with_index do |item, j|
        #   puts x_arr
        #   # puts "#{x_arr[j]} 1sp #{x_arr[j+1]} 2sp #{x_arr[2]}"
        # end 
      else     
        @numOfErr += 1
      end
    end
  end
end
