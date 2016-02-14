class LegResult
  include Mongoid::Document

  embedded_in :entrant
  embeds_one :event, as: :parent

  field :secs, type: Float

  validates :event, presence: true

  after_initialize do |doc|
    calc_ave
  end

  def calc_ave
  end

  def secs=(value)
    self[:secs] = value
    self.calc_ave
  end

end
