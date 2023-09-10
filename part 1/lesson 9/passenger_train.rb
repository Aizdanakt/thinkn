require_relative 'validation'

class PassengerTrain < Train
  include Validation
  def initialize(number)
    @type = :passenger
    super
  end
end
