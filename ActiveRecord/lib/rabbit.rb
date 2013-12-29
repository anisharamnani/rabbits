class Rabbit < ActiveRecord::Base 
	validates :name, presence: true 
end 

# info on vhy vee are validating: http://edgeguides.rubyonrails.org/active_record_validations.html