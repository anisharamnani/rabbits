# App.rb

Bundler.require
require 'bundler'
require './lib/rabbit'

DataMapper.setup(:default, ENV['DATABASE_URL']) ||  "sqlite3://#{Dir.pwd}/rabbits.db")

# list all rabbits 
get '/rabbits' do
	@rabbits = Rabbit.all 
	haml :index  
end 

# add a new rabbit 
get '/rabbits/new' do
	@rabbit = Rabbit.new 
	haml :new 
end 

# create a new rabbit 
post '/rabbits/new' do 
	@rabbit = Rabbit.new(params[:rabbit])
	if @rabbit.save 
		status 201 
		redirect '/rabbits/' + @rabbit.id.to_s
	else 
		status 400 
		haml :new 
	end 
end 

# edit rabbit 
get '/rabbits/edit/:id' do 
	@rabbit = Rabbit.get(params[:id])
	haml :edit 
end 

# update rabbit 
put '/rabbits/:id' do 
	@rabbit = Rabbit.get(params[:id])
	if @rabbit.update(params[:id])
		status 201
		redirect '/rabbits/' + params[:id]
	else 
		status 400 
		haml :edit 
	end 
end 

# delete rabbit confirmation 
get '/rabbits/delete/id' do 
	@rabbit = Rabbit.get(params[:id])
git 	haml :delete 
end 

# show rabbit 
get '/rabbits/:id' do 
	@rabbit = Rabbit.get(params[:id])
	haml :show 
end 

DataMapper.auto_upgrade! 