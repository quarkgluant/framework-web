class Routes
  # def initialize(routes_from_file)
  #   @routes = {}
  #   routes_from_file.each {|key, value| @routes[key] = Route.new(value) }
  # end
  #
  def initialize
    @routes = {}
    # eval File.read(file)
  end

  def config(&block)
    instance_eval &block
  end

  def get(path, route_to:)
    @routes[["get", path]] = Route.new(route_to)
  end

  def post(path, route_to:)
    @routes[["post", path]] = Route.new(route_to)
  end

  def find(verb, path)
    key = [verb.downcase, path.downcase.sub(%r{/$}, '')]
    @routes[key] or raise E404
  end
end