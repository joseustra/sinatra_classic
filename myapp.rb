require 'sinatra'

get '/javascripts/application.js' do
  coffee :"/assets/coffee/application" 
end

get '/' do
  erb :index
end
