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
    exec(@routes[env["PATH_INFO"]], env)
    # return [200, {}, [req.params.to_s]]
    rescue
      fail "No matching routes"
  end

  private

  def exec(route, env)
    req = Rack::Request.new(env)
    controller = Object.const_get(route['controller']).new(req.params)
    controller.send(route['method'])
  end

end
  