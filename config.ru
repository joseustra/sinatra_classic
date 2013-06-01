ENV["RACK_ENV"] ||= "development"
require 'rubygems'
require 'bundler'
Bundler.require(:default, ENV["RACK_ENV"].to_sym)
require 'sass/plugin/rack'
require './myapp'

class Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, "views") }
end

configure do
  Sass::Plugin.options[:style] = :compressed
  Sass::Plugin.options[:css_location] = "./public/stylesheets"
  Sass::Plugin.options[:template_location] = "./views/assets/sass"
  use Sass::Plugin::Rack
end

run Sinatra::Application
