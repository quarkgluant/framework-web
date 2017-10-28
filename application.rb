require 'yaml'
require 'awesome_print'
require_relative 'routes_builder'
require_relative 'renderer'

class Application
  
    def initialize
      builder = RoutesBuilder.new(YAML.load_file("routes.yml"))
      builder.build
      @routes = builder.routes
    end

    def call(env)
      # ap env
      if route_exists?(env["REQUEST_PATH"])
        HelloController.new.index
      else
        fail "Pas de route corespondante"
      end
      
    end
    private
    def route_exists?(path)
      @routes[path]
    end
end
  