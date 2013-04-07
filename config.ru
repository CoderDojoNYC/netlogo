require 'sass/plugin/rack'
use Sass::Plugin::Rack

require './application'
run Sinatra::Application
