module ValidCheck
  def valid?
    validate!
    true
  rescue
    false
  end
end