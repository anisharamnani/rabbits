# migrations/01_create_migrations.rb

Sequel.migration do 
	change do 
		create_table(:rabbits) do 
			primary_key :id 
			String :name
			Text :description
			Integer :age 
			String :color 
			DateTime :created_at 
			DateTime :updated_at
		end
	end  
end