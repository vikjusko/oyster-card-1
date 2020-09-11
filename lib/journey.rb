

class Journey  
  attr_reader :stations
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @stations = {'entry_station' => nil, 'exit_station' => nil}
  end 

  def start(station)
    @stations['entry_station'] = station
  end  

  def end(station)
    @stations['exit_station'] = station
  end 

  def complete?
   !! @stations['entry_station'] && !! @stations['exit_station']
  end  

  def fare 
   complete? == true ? MINIMUM_FARE : PENALTY_FARE 
  end

end

=begin
replace the instance variables of entry station and exit station 
with an instance variable called stations that is a hash table
=end 
