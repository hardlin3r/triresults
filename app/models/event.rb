class Event
  include Mongoid::Document

  embedded_in :parent, polymorphic: true, touch: true

  field :o, as: :order, type: Integer
  field :n, as: :name, type: String
  field :d, as: :distance, type: Float
  field :u, as: :units, type: String

  validates :order, :name, presence: true

  def meters
    case u
    when "miles" then
      d / 0.000621371
    when "yards" then
      d * 0.9144
    when "kilometers" then
      d * 1000
    when "meters" then
      d
    else
      nil
    end
  end

  def miles
    case u
    when "meters" then
      d * 0.000621371
    when "yards" then
      d * 0.000568182
    when "kilometers" then
      d * 0.621371
    when "miles" then
      d
    else
      nil
    end
  end
end
