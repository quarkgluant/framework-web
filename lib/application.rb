require 'yaml'
require 'sequel'
require 'awesome_print'
require 'erb'
require_relative 'routes_builder'
require_relative 'renderer'
require_relative 'base_controller'
Dir.glob("controller/*.rb") {|controller| require_relative "../#{controller}"}
DB = Sequel.connect('sqlite://db/database.sqlite')
Dir.glob("models/*.rb") {|filename| require_relative "../#{filename}"}

class Application

  def initialize
    builder = RoutesBuilder.new(YAML.load_file("routes.yml"))
    builder.build
    @routes = builder.routes
  end

  def call(env)
    # ap env
    route = @routes[env["REQUEST_PATH"]]
    if route
      controller = Object.const_get(route['controller']).new
      controller.send(route['method'])
    else
      fail "No matching routes"
    end

  end

end
  