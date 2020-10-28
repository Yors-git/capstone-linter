require_relative '../lib/style_rules'

describe Rules do
  include Rules
  let(:test_arr) { ['let test = 60;', 'const myFunc = 40;', 'let someName = [];'] }
  let(:test_arr2) { ['let Test = 60', 'const myFunc = 40;', 'let someName = [];'] }
  let(:test_oper) { [' ++ ', ' * '] }
  let(:test_oper2) { ['a+ b ', '3 *6'] }
  let(:test_camel) { ['const thisIsCamelCase', 'let ThisIsNotCamelCalse'] }
  let(:test_indent) { ['const myFunc = () => {', '  let test = 60'] }
  let(:test_indent2) { ['const myFunc = () => {', 'let test = 60'] }
  let(:test_sp_aftr_arg) { ['1, 2, 3'] }
  let(:test_sp_aftr_arg2) { ['1,2, 3'] }

  describe '#semicolons' do
    it 'checks if a line has a semicolon at the end' do
      @num_of_err = 0
      @err_semicolons = []
      expect(semicolons(test_arr2)).to eql([1, [1]])
    end

    it 'should not return any semicolon error' do
      expect(semicolons(test_arr)).to eql([nil, nil])
    end
  end

  describe '#space_around_operators' do
    it 'checks for the amount of space operator errors and in which line it found them' do
      @num_of_err = 0
      @err_sp_arnd_op = []
      expect(space_around_operators(test_oper2)).to eql([2, [1, 2]])
    end

    it 'confirms that there is no errors according to test case' do
      expect(space_around_operators(test_oper)).to eql([nil, nil])
    end
  end

  describe '#camel_case_var' do
    it 'checks that when a variable is declared it has a lowercase first letter' do
      @num_of_err = 0
      @err_camel = []
      expect(camel_case_var(test_camel)).to eql([1, [2]])
    end
  end

  describe '#indentation' do
    it 'confirms the item after the one ending with open curly brace has two spaces at the beginning' do
      @num_of_err = 0
      @err_indent = []
      @stack = []
      @indent = 0
      expect(indentation(test_indent)).to eql([0, []])
    end
    it 'finds one error of less than two spaces indentation after the line with the open curly brace' do
      @num_of_err = 0
      @err_indent = []
      @stack = []
      @indent = 0
      expect(indentation(test_indent2)).to eql([1, [2]])
    end
  end

  describe '#space_after_arguments' do
    it 'confirms that there is a space after each comma acorrding to test case' do
      @num_of_err = 0
      @err_sp_arg = []
      expect(space_after_arguments(test_sp_aftr_arg)).to eql([0, []])
    end
    it 'finds one error of a missing space after a comma' do
      @num_of_err = 0
      @err_sp_arg = []
      expect(space_after_arguments(test_sp_aftr_arg2)).to eql([1, [1]])
    end
  end
end
