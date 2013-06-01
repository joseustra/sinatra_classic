require 'rubygems'
require 'bundler'
Bundler.require(:default)
require 'sass/plugin/rack'
require './myapp'


configure do
  Sass::Plugin.options[:style] = :compressed

  use Sass::Plugin::Rack
  use Rack::Coffee, root: 'public', urls: '/javascripts'
end

run Sinatra::Application
