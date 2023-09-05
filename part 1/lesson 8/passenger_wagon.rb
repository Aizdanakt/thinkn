class PassengerWagon < Wagon
  def initialize(place)
    @type = :passenger
    super
  end

  def take_place
    validate!
    @used_place += 1
  end

  def validate!
    errors = []
    errors << 'Мест нет!' if free_place.zero?
    raise errors.join('.') unless errors.empty?
  end
end
