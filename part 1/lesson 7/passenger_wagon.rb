class PassengerWagon < Wagon

  def initialize(seats)
    @type = :passenger
    super
  end
  #удалю после проверки на корректность
  # def take_seat
  #   @seats_wagon[0] = @seats_wagon[0] + 1
  # end

  # def occupied_seats
  #   @seats_wagon[0]
  # end

  # def available_seats
  #   @seats_wagon[1] - @seats_wagon[0]
  # end
end
