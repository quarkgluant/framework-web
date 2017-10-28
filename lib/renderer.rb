class Renderer
  def initialize(filename, binding)
    @filename = filename
    @binding = binding
  end
  
  def render
    if File.exists?(@filename)
      template =  File.read(@filename)
      [200, ERB.new(template).result(@binding)]
    else
      [500, "<h1>500</h1><p>No such template: #{@filename}</p>"]
    end 
  end

end