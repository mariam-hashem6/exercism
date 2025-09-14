class AssemblyLine
  CARS_COUNT_PER_HOUR = 221
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    base_rate = CARS_COUNT_PER_HOUR * @speed
    success_rate = case @speed 
                   when 1..4 then 1.0
                   when 5..8 then 0.9
                   when 9 then 0.8
                   when 10 then 0.77
                   else 0.0
                   end
      base_rate * success_rate
  end
  
  def working_items_per_minute
    hourly_rate = production_rate_per_hour
    (hourly_rate / 60).to_i
  end
end
