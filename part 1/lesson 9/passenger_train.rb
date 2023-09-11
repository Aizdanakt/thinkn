class PassengerTrain < Train

  NUMBER_FORMAT = /^[а-яa-z\d]{3}-?[а-яa-z\d]{2}/

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  validate :number, :type, String

  def initialize(number)
    @type = :passenger
    super
  end
end
