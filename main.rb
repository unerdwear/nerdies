require 'rubygems'
require 'sinatra'

set :public_folder, 'public'

get '/' do
  redirect '/index.html'
end

get '/wash' do
  redirect '/wash.html'
end

get '/about' do
  redirect '/about.html'
end


