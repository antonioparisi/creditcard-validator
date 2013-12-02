# encoding: UTF-8
Dir["./lib/**/*.rb"].each { |f| require f }

puts 'Credit Card Validator using Luhn Algorithm'
puts 'by Antonio Parisi <ant.parisi@gmail.com> - 2013'
puts 'Skype: code87_m3nTe'
puts 'How to use it:'
puts 'Insert any CCs, one per row. Eg: 4408041234567893'
puts 'Type \'x\' or \'exit\' for finish the process'

Prompt.new.read_credit_cards
