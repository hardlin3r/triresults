class Address
  attr_accessor :city, :state, :location

  def initialize(city, state, loc)
    @city = city
    @state = state
    @location = loc
  end

  def mongoize
    { city: @city, state: @state, loc: Point.mongoize(@location) }
  end

  def self.mongoize(object)
    case object
    when nil then nil
    when Hash then
      { city: object[:city], state: object[:state], loc: object[:loc] }
    when (Address) then
      { city: object.city, state: object.state, loc: Point.mongoize(object.location) }
    end
  end

  def self.demongoize(object)
    case object
    when nil then nil
    when Hash then
      city = object[:city]
      state = object[:state]
      location = object[:loc]
      Address.new(city, state, Point.demongoize(location))
    when (Address) then
      Address.new(object.city, object.state, Point.demongoize(object.location))
    end
  end

  def self.evolve(object)
    case object
    when nil then nil
    when Hash then
      { city: object[:city], state: object[:state], loc: object[:loc] }
    when (Address) then
      { city: object.city, state: object.state, loc: Point.mongoize(object.location) }
    end
  end


end
