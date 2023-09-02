class CargoWagon < Wagon

  def initialize(volume)
    @type = :cargo
    super
  end
  #удалю после проверки на корректность
  # def take_volume(volume)
  #   @volume_wagon[0] = @volume_wagon[0] + volume
  # end
  #
  # def occupied_volume
  #   @volume_wagon[0]
  # end
  #
  # def available_volume
  #   @volume_wagon[1] - @volume_wagon[0]
  # end
end