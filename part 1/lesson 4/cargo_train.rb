class CargoTrain < Train
  attr_reader :type

  def initialize(num)
    super(num)
    @type = "cargo"
  end
end
