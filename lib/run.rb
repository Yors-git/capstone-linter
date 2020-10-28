require_relative './style_rules.rb'

class Run
  include Rules

  def messages(linted)
    semicolons(linted)
    space_around_operators(linted)
    camel_case_var(linted)
    indentation(linted)
    space_after_arguments(linted)
    if @num_of_err.positive?
      puts "Found #{@num_of_err} errors"
      puts "Missing semicolons in line(s) #{@err_semicolons}" if @err_semicolons.length.positive?
      puts "Missing space around operators in line(s) #{@err_sp_arnd_op}" if @err_sp_arnd_op.length.positive?
      puts "Variables should start with lowercase letters, line(s) #{@err_camel}" if @err_camel.length.positive?
      puts "Incorrect indentation in line(s) #{@err_indent}" if @err_indent.length.positive?
      puts "Missing space between arguments #{@err_sp_arg}" if @err_sp_arg.length.positive?
    else
      puts 'No errors found!'
    end
  end
end
