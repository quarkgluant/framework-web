require 'yaml'
require 'awesome_print'
require_relative 'routes_builder'
require_relative 'renderer'
require_relative 'controller/greetings_controller'
require_relative 'controller/root_controller'


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
  