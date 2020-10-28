require_relative '../lib/style_rules.rb'

describe Rules do
  let!(:to_lint) {Rules.new}
  let!(:test_arr) {["let test = 60;\n", "const myFunc = 40;\n", "let someName = [] {\n", "\n"]}

  describe '#semicolons' do
    it 'checks if a line has a semicolon at the end' do
      expect(to_lint.semicolons(test_arr)).to eql('Missing semicolon in line 1')
    end
  end
end