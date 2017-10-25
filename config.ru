class Application
  def call(env)
    [200, {}, ["Bonjour tout le monde !"]]
  end
end

run Application.new