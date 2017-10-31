class Routes
    def initialize(routes_from_file)
      @routes = {}
      routes_from_file.each { |key, value| @routes[key] = Route.new(value) }
    end

    def find(verb, path)
      key = [verb.downcase, path.downcase.sub(%r{/$}, '')]
      @routes[key]
    end



  # private
  #
  # def build_route(values)
  #   controller, method = values['to'].split('#')
  #   controller = controller.capitalize + 'Controller'
  #   { 'via' => values['via'], 'controller' => controller , 'method' => method }
  # end
end