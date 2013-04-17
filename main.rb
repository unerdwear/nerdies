require 'rubygems'
require 'sinatra'
require 'haml'
require 'compass'
require 'sass'
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

configure :production do
  use Rack::Static, urls: ['/stylesheets'], root: File.expand_path('../tmp', __FILE__)
  Sass::Plugin.options.merge!(template_location: 'public/stylesheets/',
                              css_location: 'tmp/stylesheets')
end

get '/stylesheets/*.css' do
  filename = params[:splat].first
  scss filename.to_sym, :views => "#{settings.root}/public/stylesheets"
end
