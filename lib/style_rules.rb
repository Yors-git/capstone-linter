# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
class Rules
  attr_accessor :num_of_err

  def initialize
    @num_of_err = 0
    @indentation = 0
    @stack = []
    @tmp = ' '
  end

  def semicolons(lines)
    lines.each_with_index do |x, i|
      if x.end_with?(";\n") || x.end_with?("{\n") || x.end_with?("}\n") || x == "\n" || x.include?('//')
      else
        puts "Missing semicolon in line #{i + 1}"
        @num_of_err += 1
      end
    end
  end

  def space_around_operators(lines)
    lines.each_with_index do |x, i|
      x_arr = x.split('')
      x_arr.each_with_index do |item, j|
        if (item =~ /[\+\-\*\=\%\<\>]/).is_a?(Integer) &&
           (x_arr[j - 1] =~ /\S/).is_a?(Integer) &&
           (x_arr[j - 1] =~ /[\+\-\*\=\%\<\>]/).nil?
          puts "Missing space before #{item} sign in line #{i + 1} column #{j + 1}"
          @num_of_err += 1
        elsif (item =~ /[\+\-\*\=\%\<\>]/).is_a?(Integer) &&
              (x_arr[j + 1] =~ /\S/).is_a?(Integer) &&
              (x_arr[j + 1] =~ /[\+\-\*\=\%\<\>]/).nil?
          puts "Missing space after #{item} sign in line #{i + 1} column #{j + 2}"
          @num_of_err += 1
        end
      end
    end
  end

  def camel_case_var(lines)
    lines.each_with_index do |x, i|
      case x
      when /const/
        unless (x[(x.index('const') + 6)] =~ /[A-Z]/).nil?
          puts "Variables should not start with uppercase, check line #{i + 1}"
          @num_of_err += 1
        end
      when /let/
        unless (x[(x.index('let') + 4)] =~ /[A-Z]/).nil?
          puts "Variables should not start with uppercase, check line #{i + 1}"
          @num_of_err += 1
        end
      when /var/
        unless (x[(x.index('var') + 4)] =~ /[A-Z]/).nil?
          puts "Variables should not start with uppercase, check line #{i + 1}"
          @num_of_err += 1
        end
      end
    end
  end

  def indentation(lines)
    lines.each_with_index do |x, i|
      cond1 = !/^(\s{#{@indentation}})/.match(x).nil?
      x.each_char do |c|
        if c == '{'
          @stack << c
          @indentation += 2
        elsif c == '}'
          @temp = @stack.pop
          @indentation -= 2 if @temp == '{' && c == '}'
        end
      end
      cond2 = !/^(\s{#{@indentation}})/.match(x).nil?

      if !cond1 && !cond2
        puts "Incorrect indentation, please check line #{i + 1}"
        @num_of_err += 1
      end
    end
  end

  def space_after_arguments(lines)
    lines.each_with_index do |x, i|
      next unless x.include?(',')

      commas = (0...x.length).find_all { |ind| x[ind, 1] == ',' }
      commas.each do |com|
        if x[com + 1] != ' '
          puts "Missing space after argument in line #{i + 1} column #{com + 2}"
          @num_of_err += 1
        end
      end
    end
  end
end
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
