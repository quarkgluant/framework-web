class RootController
  def hello
    status, body = Renderer.new("hello.html").render
    [status, {}, [body]]
  end

  def hola
    status, body = Renderer.new("hola.html").render
    [status, {}, [body]]
  end

end