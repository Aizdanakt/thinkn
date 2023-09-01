class PassengerWagon < Wagon
  attr_reader :seats_wagon

  def initialize(seats)
    @seats_wagon = [0, seats]
    @type = :passenger
  end

  def take_seat
    @seats_wagon[0] = @seats_wagon[0] + 1
  end

  def occupied_seats
    @seats_wagon[0]
  end

  def available_seats
    @seats_wagon[1] - @seats_wagon[0]
  end
end
