class PassengerTrain < Train
  attr_reader :type

  def initialize(num)
    super(num)
    @type = "passenger"
  end
end