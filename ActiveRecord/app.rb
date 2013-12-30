# App.rb

require 'bundler'
Bundler.require
require './lib/rabbit'

class App < Sinatra::Application
	set :database, "sqlite3:///rabbits.db"

	# list all rabbits 
	get '/rabbits' do
		@rabbits = Rabbit.order("created_at DESC")
		haml :index  
	end 

	# add a new rabbit 
	get '/rabbits/new' do
		@rabbit = Rabbit.new 
		haml :new 
	end 

	# create a new rabbit 
	post '/rabbits' do 
		@rabbit = Rabbit.new(params[:rabbit])
		if @rabbit.save 
			status 201 #Created (p.s. thanks nikki for these notes!)
			redirect '/rabbits/' + @rabbit.id.to_s
		else 
			status 400 #Bad Request 
			haml :new 
		end 
	end 

	# edit rabbit 
	get '/rabbits/edit/:id' do 
		@rabbit = Rabbit.find(params[:id])
		haml :edit 
	end 

	# update rabbit 
	put '/rabbits/:id' do 
		@rabbit = Rabbit.find(params[:id])
		if @rabbit.update(params[:id])
			status 201
			redirect '/rabbits/' + params[:id]
		else 
			status 400 
			haml :edit 
		end 
	end 

	# delete rabbit confirmation 
	get '/rabbits/delete/:id' do 
		@rabbit = Rabbit.find(params[:id])
		haml :delete 
	end 

	# delete rabbit 
	delete '/rabbits/:id' do 
		Rabbit.find(params[:id]).destroy
		redirect '/rabbits'
	end 

	# show rabbit 
	get '/rabbits/:id' do 
		@rabbit = Rabbit.find(params[:id])
		haml :show 
	end 

end 