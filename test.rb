require_relative 'tsv_buddy'
require_relative 'yaml_buddy'

class Tester
  include TsvBuddy
  include YamlBuddy

  attr_accessor :data
end

file = File.read('data/survey.tsv')
puts file.inspect
puts "-------------------"

test = Tester.new
test.take_yaml(File.read('data/survey.yml'))
#puts test.data
# # yml = test.to_yaml(@data)
# # puts yml
#test.take_tsv(File.read('data/survey.tsv'))
#puts @data
tsv = test.to_tsv
puts tsv.inspect

