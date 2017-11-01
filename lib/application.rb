require 'yaml'
require 'awesome_print'
require 'erb'
require_relative 'error'
require_relative 'include_css'
require_relative 'include_javascript'
require_relative 'renderer'
require_relative 'routes'
require_relative 'route'
require_relative 'base_controller'


Dir.glob("controller/*.rb") {|filename| require_relative "../#{filename}"}

DB = Sequel.connect('sqlite://db/database.sqlite')

Dir.glob("models/*.rb") {|filename| require_relative "../#{filename}"}

class Application
  include Error

  def initialize
    @routes = Routes.new(YAML.load_file("routes.yml"))
    ap @routes
  end

  def call(env)
    # ap env
    route = @routes.find(env["REQUEST_METHOD"], env["PATH_INFO"])
    req = Rack::Request.new(env)
    # pry.binding
    # ap env["REQUEST_METHOD"]
    # ap env["PATH_INFO"]
    # ap route
    route.exec_with(req.params)
  rescue E404 => ex
    # ap req
    error_404
  # rescue
    # ap req
    # error_500
  end

end
