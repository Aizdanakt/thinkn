class CargoTrain < Train
  def initialize(number)
    @type = :cargo
    validate!
    super
  end
end