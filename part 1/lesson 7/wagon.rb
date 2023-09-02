require_relative 'company'
class Wagon
  include Company
  attr_reader :type, :seats_wagon

  def initialize(seats)
    @seats_wagon = [0, seats]
  end

  def take_seat(seat=1)
    @seats_wagon[0] = @seats_wagon[0] + seat
  end

  def occupied_seats
    @seats_wagon[0]
  end

  def available_seats
    @seats_wagon[1] - @seats_wagon[0]
  end
end
