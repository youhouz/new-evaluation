require 'sinatra'
require 'sinatra/reloader' if development?


get '/' do 
	erb :index
end

get'/accueil' do 
	erb :accueil
end
get '/message' do
	
	erb :message
end

get '/aboutus' do

	erb :index2
end

get'/annuaire' do
	noms = ""
	File.open("noms.txt",'r') do |file|
		noms = file.readlines
	end
	logger.info noms

	erb :annuaire, locals: {noms: noms}
end

post'/inscription' do
	logger.info params
	File.open("noms.txt",'a') do |file|
		file.puts(params["nom"])
	end
	erb :inscription
end