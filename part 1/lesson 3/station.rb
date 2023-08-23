class Station

  def initialize(name)
    @name = name
    @trains = {}
  end

  def accept_train(train_name, train_type)
    @trains[train_name] = train_type
  end

  def show_trains
    @trains.each{|k, v| puts "Поезд #{k} типа #{v} находится в данный момент на станции"}
  end

  def trains_by_type(type)
    @trains.values.count(type)
  end

  def send_a_train(name_to_send)
    @trains.delete(name_to_send)
  end
end