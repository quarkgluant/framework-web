class Renderer
  def initialize(filename, binding)
    @filename = filename
    @binding = binding
  end
  
  def render
    if File.exists?(@filename)
      [200, result]
    else
      [500, no_template]
    end 
  end

  private

  def template
    template =  File.read(@filename)
  end

  def result
    content = ERB.new(template).result(@binding)
    insert_into_main_template { content }
  end

  def insert_into_main_template
    ERB.new(main_template).result(binding)
  end

  def main_template
    File.read('views/layouts/application.html.erb')
  end

  def no_template
    "<h1>500</h1><p>No such template: #{@filename}</p>"
  end
end