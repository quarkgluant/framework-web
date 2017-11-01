class Notice
  def initialize(session)
    @session = session
    if @session['notice']
      @value = @session['notice']
      @session.delete('notice')
    else
      @value = nil
    end
  end

  def value=(content)
    @value = content
    @session.store('notice', content)
  end

  def value
    @value
  end
end
