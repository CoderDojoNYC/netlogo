require 'sinatra'
require 'haml'
require 'coffee-script'
require 'redcarpet'

get '/' do
  haml :index, format: :html5, layout: !pjax?
end

get '/:javascript.js' do |javascript|
  coffee :"/app/assets/javascripts/#{javascript}"
end

get '/:stylesheet.css' do |stylesheet|
  sass :"/app/assets/stylesheets/#{stylesheet}"
end

get '/:markdown.mdown' do |markdown|
  mdown markdown
end

get '/references/:page' do
  haml :"/references/#{params[:page]}", layout: !pjax?
end

helpers do
  def pjax?
    env['HTTP_X_PJAX']
  end

  def partial page, variables = {}
    haml page.to_sym, { layout: !pjax? }, variables
  end

  def mdown lesson
    partial :'shared/markdown', { markdown: render_markdown(lesson) }
  end

  def render_markdown filename
    redcarpet = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    redcarpet.render(File.read(File.join(File.dirname(__FILE__), "views/lessons/#{filename}.mdown")))
  end
end
