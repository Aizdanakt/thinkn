class PassengerWagon < Wagon

  def initialize(place)
    @type = :passenger
    super
  end

  def take_place
    @used_place += 1
  end
end
