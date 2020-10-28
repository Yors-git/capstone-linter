require_relative '../lib/style_rules'

describe Rules do
  let(:to_lint) { Rules.new }
  let(:test_arr) { ["let Test = 60;",  "const myFunc = 40;", "let someName = [];"] }
  let(:test_arr2) { ["let Test = 60",  "const myFunc = 40;", "let someName = [];"] }
  let(:test_oper) { [" ++ ", " * "] }
  let(:test_camel) { ["thisIsCamelCase", "alsoThis"] }
  # let(:file_data) {File.read('../to_check/test2.js').split}
  let(:file_data) {File.foreach('../to_check/test2.js') { |line| file_data.push(line) }}

  describe '#semicolons' do
    it 'checks if a line has a semicolon at the end' do
      expect(to_lint.semicolons(test_arr)).to all(end_with(';'))
    end

    # it 'checks if a line has a semicolon at the end' do
    #   expect(to_lint.semicolons(test_arr2)).to eql("Missing semicolon in line 1")
    # end
  end

  describe '#space_around_operators' do
    it 'checks that there are spaces before each math operator' do
      expect(to_lint.space_around_operators(test_oper)).to all(start_with(" ")) 
    end

    it 'checks that there are spaces after each math operator' do
      expect(to_lint.space_around_operators(test_oper)).to all(end_with(" ")) 
    end
  end

  describe '#camel_case_var' do
    it 'checks that when a variable is declared it has a lowercase first letter' do
      expect(to_lint.camel_case_var(test_camel)).to all(start_with(/[a-z]/))
    end
  end

  # describe '#indentation' do
  #   it 'checks for a 2 space indentation each time it finds an opening curly brace' do
  #     expect(to_lint.indentation('{'))to eql(to_lint.@indentation)
  #   end
  # end

  # describe '#space_after_arguments' do
  #   it 'checks if there is a space after each comma' do
  #     expect(to_lint.space_after_arguments('1, 2, 3').to not_eql('Missing space after argument in line 1')
  #   end
  # end

end