
class Route
  def initialize(value)
    @controller, @method = value.split('#')
    @controller = @controller.capitalize + 'Controller'
  end

  attr_reader :controller, :method
end