class RootController
  def index
    status, body = Renderer.new("root.html").render
    [status, {}, [body]]
  end
end