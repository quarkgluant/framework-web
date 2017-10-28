class BaseController

  private

  def render(filename)
    status, body = Renderer.new(filename).render
    [status, {}, [body]]
  end
end