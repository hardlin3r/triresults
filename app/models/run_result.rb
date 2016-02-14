class RunResult < LegResult

  field :mmile, as: :minute_mile, type: Float

  def calc_ave
    if event && secs
      miles = event.miles
      self.minute_mile = miles.nil? ? nil: miles * 60 / secs
    end
  end

end
