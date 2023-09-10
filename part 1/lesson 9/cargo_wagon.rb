class CargoWagon < Wagon
  def initialize(volume)
    @type = :cargo
    super
  end

  def take_volume(volume)
    validate!(volume)
    @used_place += volume
  end

  def validate!(volume)
    errors = []
    errors << 'Места не осталось!' if free_place < volume
    raise errors.join('.') unless errors.empty?
  end
end
