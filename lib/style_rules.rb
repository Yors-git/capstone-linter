# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
module Rules
  attr_accessor :num_of_err, :err_semicolons, :err_sp_arnd_op, :err_camel, :err_indent, :err_sp_arg, :indent, :stack, :tmp

  def semicolons(lines)
    lines.each_with_index do |x, i|
      if x.end_with?(";\n") ||
         x.end_with?("{\n") ||
         x.end_with?("}\n") ||
         x == "\n" ||
         x.include?('//') ||
         x.end_with?(';')
      else
        @num_of_err += 1
        @err_semicolons << i + 1
      end
    end
    return @num_of_err, @err_semicolons
  end

  def space_around_operators(lines)
    lines.each_with_index do |x, i|
      x_arr = x.split('')
      x_arr.each_with_index do |item, j|
        if (item =~ /[\+\-\*\=\%\<\>]/).is_a?(Integer) &&
           (x_arr[j - 1] =~ /\S/).is_a?(Integer) &&
           (x_arr[j - 1] =~ /[\+\-\*\=\%\<\>]/).nil?
          @err_sp_arnd_op << i + 1
          @num_of_err += 1
        elsif (item =~ /[\+\-\*\=\%\<\>]/).is_a?(Integer) &&
              (x_arr[j + 1] =~ /\S/).is_a?(Integer) &&
              (x_arr[j + 1] =~ /[\+\-\*\=\%\<\>]/).nil?
          @err_sp_arnd_op << i + 1
          @num_of_err += 1
        end
      end
    end
    return @num_of_err, @err_sp_arnd_op
  end

  def camel_case_var(lines)
    lines.each_with_index do |x, i|
      case x
      when /const/
        unless (x[(x.index('const') + 6)] =~ /[A-Z]/).nil?
          @err_camel << i + 1
          @num_of_err += 1
        end
      when /let/
        unless (x[(x.index('let') + 4)] =~ /[A-Z]/).nil?
          @err_camel << i + 1
          @num_of_err += 1
        end
      when /var/
        unless (x[(x.index('var') + 4)] =~ /[A-Z]/).nil?
          @err_camel << i + 1
          @num_of_err += 1
        end
      end
    end
    return @num_of_err, @err_camel
  end

  def indentation(lines)
    lines.each_with_index do |x, i|
      cond1 = !/^(\s{#{@indent}})/.match(x).nil?
      x.each_char do |c|
        if c == '{'
          @stack << c
          @indent += 2
        elsif c == '}'
          @temp = @stack.pop
          @indent -= 2 if @temp == '{' && c == '}'
        end
      end
      cond2 = !/^(\s{#{@indent}})/.match(x).nil?

      if !cond1 && !cond2
        @err_indent << i + 1
        @num_of_err += 1
      end
    end
    return @num_of_err, @err_indent
  end

  def space_after_arguments(lines)
    lines.each_with_index do |x, i|
      next unless x.include?(',')

      commas = (0...x.length).find_all { |ind| x[ind, 1] == ',' }
      commas.each do |com|
        if x[com + 1] != ' '
          @err_sp_arg << i + 1
          @num_of_err += 1
        end
      end
    end
    return @num_of_err, @err_sp_arg
  end
end
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
