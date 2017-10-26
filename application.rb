require 'yaml'
require 'awesome_print'
require_relative 'hello_controller'
require_relative 'renderer'

class Application
  
    def initialize
      @routes = YAML.load_file("routes.yml")
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
  