require_relative "instance_counter"
class Station
  include InstanceCounter

  attr_reader :trains, :name
  @@stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
    validate!
  end

  def add_train(train)
    @trains << train
  end

  def delete_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.select {|train| train.type == type}.count
  end

  def self.all
    @@stations
  end

  def valid?
    begin
      validate!
    rescue TypeError => e
      false
    else
      true
    end
  end

  private

  def validate!
    raise puts "Имя не может быть пустым!" if name == ""
    raise puts "Имя не может быть менее 3 символов!" if name.length < 3
  end
end