class RaceRef
  include Mongoid::Document

  embedded_in :entrant

  field :n, as: :name, type: String
  field :date, type: Date
end
