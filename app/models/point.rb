class Point
  attr_accessor :longitude, :latitude

  def initialize(lng, lat)
    @longitude = lng
    @latitude = lat
  end

  def mongoize
    { type: "Point", coordinates: [@longitude, @latitude] }
  end

  def self.mongoize(object)
    case object
    when nil then nil
    when Hash then object
    when (Point) then { type: "Point", coordinates: [object.longitude, object.latitude] }
    end
  end

  def self.demongoize(object)
    case object
    when nil then nil
    when Hash then
      longitude = object[:coordinates][0] if object[:coordinates]
      latitude = object[:coordinates][1] if object[:coordinates]
      Point.new(longitude, latitude)
    when (Point) then
    end
  end

  def self.evolve(object)
    case object
    when nil then nil
    when Hash then object
    when (Point) then { type: "Point", coordinates: [object.longitude, object.latitude] }
    end
  end

end
