require 'sinatra'
require 'compass'
require 'sass'
require 'haml'

set :haml, { :format => :html5 }
set :scss, Compass.sass_engine_options

get '/' do
  @id = "home"
  haml :home
end

get '/wash' do
  @id = "wash"
  haml :wash
end

get '/about' do
  @id = "about"
  haml :about
end

get '/fit' do
  @id = "fit"
  haml :fit
end

get '/stylesheets/*.css' do
  content_type 'text/css', :charset => 'utf-8'
  filename = params[:splat].first
  scss filename.to_sym, :views => "#{settings.root}/public/stylesheets"
end
