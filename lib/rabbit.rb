class Rabbit 
	include DataMapper::Resource 
	property :id, Serial 
	property :name, String, :required => true 
	property :description, Text 
	property :age, Integer
	property :color, String 
	property :created_at, DateTime 
	property :updated_at, DateTime  
end 