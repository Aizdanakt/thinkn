class CargoWagon < Wagon

  def initialize(volume)
    @type = :cargo
    super
  end

  def take_volume(volume)
    @used_place += volume
  end
end