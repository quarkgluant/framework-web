require 'yaml'
require 'sequel'
require 'awesome_print'
require 'erb'
require_relative 'routes'
require_relative 'route'
require_relative 'renderer'
require_relative 'base_controller'
Dir.glob("controller/*.rb") {|controller| require_relative "../#{controller}"}
DB = Sequel.connect('sqlite://db/database.sqlite')
Dir.glob("models/*.rb") {|filename| require_relative "../#{filename}"}

class Application

  def initialize
    # builder = Routes.new(YAML.load_file("routes.yml"))
    # builder.build
    # @routes = builder.routes
    @routes = Routes.new(YAML.load_file("routes.yml"))
    ap @routes
  end

  def call(env)
    # ap env
    # exec(@routes[env["PATH_INFO"]], env)
    # return [200, {}, [req.params.to_s]]
    route = @routes.find(env["REQUEST_METHOD"], env["PATH_INFO"])
    req = Rack::Request.new(env)
    # ap env["REQUEST_METHOD"]
    # ap env["PATH_INFO"]
    # ap route
    route.exec_with(req.params)
  rescue

    # ap req
      fail "No matching routes"
  end

  private

  # def exec(route, env)
  #   req = Rack::Request.new(env)
  #   controller = Object.const_get(route['controller']).new(req.params)
  #   controller.send(route['method'])
  # end

  # def exec(route, params)
  #   controller = Object.const_get(route.controller).new(params)
  #   controller.send(route.method)
  # end
end
  