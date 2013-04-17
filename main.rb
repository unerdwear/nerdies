require 'rubygems'
require 'compass'
require 'sinatra'
require 'sass'
require 'haml'
require 'hassle'

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views'
  end
  set :haml, { :format => :html5 }
  set :scss, Compass.sass_engine_options
  set :sass, Compass.sass_engine_options
end

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

get '/stylesheets/*.css' do
  content_type 'text/css', :charset => 'utf-8'
  filename = params[:splat].first
  scss filename.to_sym, :views => "#{settings.root}/public/stylesheets"
end
