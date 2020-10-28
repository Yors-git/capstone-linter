def semicolons(lines)
  num_of_err = 0
  err_semicolons = []
  lines.each_with_index do |x, i|
    if x.end_with?(";\n") ||
       x.end_with?("{\n") ||
       x.end_with?("}\n") ||
       x == "\n" ||
       x.include?('//') ||
       x.end_with?(';')
    else
      num_of_err += 1
      err_semicolons << i + 1
    end
  end
  return num_of_err, err_semicolons
end

arr = ['let Test = 60', 'const myFunc = 40;', 'let someName = [];']

puts semicolons(arr)