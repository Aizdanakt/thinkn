class CargoWagon < Wagon
  attr_reader :volume_wagon

  def initialize(volume)
    @volume_wagon = [0, volume]
    @type = :cargo
  end

  def take_volume(volume)
    @volume_wagon[0] = @volume_wagon[0] + volume
  end

  def occupied_volume
    @volume_wagon[0]
  end

  def available_volume
    @volume_wagon[1] - @volume_wagon[0]
  end
end