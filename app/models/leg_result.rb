class LegResult
  include Mongoid::Document

  embedded_in :entrant

  field :secs, type: Float

  after_initialize do |doc|
    calc_ave
  end

  def calc_ave
  end

  def secs=(value)
    self[:secs] = value
    calc_ave
  end

end
