require_relative 'validation'

class CargoTrain < Train
  include Validation
  def initialize(number)
    @type = :cargo
    super
  end
end
