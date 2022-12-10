# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'
require 'date'

## Your test code can go here
# puts @candidates
# pp @candidates
# puts find(5)
puts qualified_candidates(@candidates)
puts ordered_by_qualifications(@candidates)