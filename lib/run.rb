require_relative './style_rules.rb'

class Run
  include Rules
  attr_accessor :report,
                :num_of_err,
                :err_semicolons,
                :err_sp_arnd_op,
                :err_camel,
                :err_indent,
                :err_sp_arg,
                :indent,
                :stack,
                :tmp

  def initialize
    @report = []
    @num_of_err = 0
    @err_semicolons = []
    @err_sp_arnd_op = []
    @err_camel = []
    @err_indent = []
    @err_sp_arg = []
    @indent = 0
    @stack = []
    @tmp = ' '
  end

  def messages(linted)
    semicolons(linted)
    @report << "Missing semicolons in line(s) #{@err_semicolons}" if @err_semicolons.length.positive?
    space_around_operators(linted)
    @report << "Missing space around operators in line(s) #{@err_sp_arnd_op}" if @err_sp_arnd_op.length.positive?
    camel_case_var(linted)
    @report << "Variables should start with lowercase letters, line(s) #{@err_camel}" if @err_camel.length.positive?
    indentation(linted)
    @report << "Incorrect indentation in line(s) #{@err_indent}" if @err_indent.length.positive?
    space_after_arguments(linted)
    @report << "Missing space between arguments #{@err_sp_arg}" if @err_sp_arg.length.positive?
  end
end
