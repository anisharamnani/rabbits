# artist.r\b
require 'sequel'

DB = Sequel.connect('sqlite://rabbits.db')

class Rabbit < Sequel::Model 
	plugin :timestamps
end 