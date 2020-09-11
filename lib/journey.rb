

class Journey  
  attr_reader :stations
  MINIMUM_FARE = 1
  CROSSING_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @stations = {'entry_station' => nil,'enty_zone' => nil, 'exit_station' => nil, 'exit_zone' => nil }
  end 

  def start(station, zone)
    @stations['entry_station'] = station
    @stations['entry_zone'] = zone
  end  

  def end(station, zone)
    @stations['exit_station'] = station
    @stations['exit_zone'] = zone
  end 

  def complete?
   !! @stations['entry_station'] && !! @stations['exit_station']
  end  

  def fare 
   complete? == true ? calculate_fare : PENALTY_FARE 
  end

  private 
  def calculate_fare
  difference = (self.stations['exit_zone'] - self.stations['entry_zone']).abs 
  if difference == 0 
    MINIMUM_FARE
  else 
    difference * CROSSING_FARE
  end 
  end 

end

=begin
replace the instance variables of entry station and exit station 
with an instance variable called stations that is a hash table
=end 
