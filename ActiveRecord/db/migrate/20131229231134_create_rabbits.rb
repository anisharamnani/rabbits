class CreateRabbits < ActiveRecord::Migration
  def up
  	create_table :rabbits do |t|
  		t.string :name 
  		t.text :description 
  		t.integer :age 
  		t.string :color
  		t.timestamps 
  	end 
  end

  def down
  	drop_table :rabbits
  end
end
