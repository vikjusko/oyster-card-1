

class Journey  
  attr_reader :entry_station, :finish_station
  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  def start(station)
    @entry_station = station
  end  

  def end(station)
    @finish_station = station
  end 

  def complete?
   !! @entry_station && !! @finish_station
  end  

  def fare 
   complete? == true ? MINIMUM_FARE : PENALTY_FARE 
  end

end
