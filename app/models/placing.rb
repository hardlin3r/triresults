class Placing
  attr_accessor :name, :place

  def initialize(name, place)
    @name = name
    @place = place
  end

  def mongoize
    { name: @name, place: @place }
  end

  def self.mongoize(object)
    case object
    when nil then nil
    when Hash then
      { name: object[:name], place: object[:place] }
    when (Placing) then
      { name: object.name, place: object.place }
    end
  end

  def self.demongoize(object)
    case object
    when nil then nil
    when Hash then
      Placing.new(object[:name], object[:place])
    when (Placing) then
      Placing.new(object.name, object.place)
    end
  end

  def self.evolve(object)
    case object
    when nil then nil
    when Hash then
      { name: object[:name], place: object[:place] }
    when (Placing) then
      { name: object.name, place: object.place }
    end
  end

end
