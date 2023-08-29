module NameCompany
  attr_accessor :name_company
end

class Train
  include NameCompany
  def initialize(name)
    @name = name
  end
end
q = Train.new("qqq")
q.name_company=("Асикс")
puts q.name_company
