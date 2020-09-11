require_relative 'journey'

class JourneyLog
  attr_reader :journey, :travelling_journey, :journey_log 
  def initialize(journey = Journey.new)
    @journey = journey
    #@travelling_journey = {}
    @journey_log = []
  end

  def start(station, zone)
    @journey.start(station, zone)
  end 

  def current_journey
    #!!@journey.stations['entry_station'] == true ? @travelling_journey['start_station'] = @journey.entry_station : @journey = Journey.new
    # @travelling_journey
    if !!journey.stations['entry_station'] == true  
      journey.stations['entry_station']
    else
      @journey = Journey.new
    end 
  end 

  def finish(station, zone)
    @journey.end(station, zone)  
    # @journey_log << @journey.stations
    # @journey = Journey.new
  end 

  def journeys
    @journey_log << @journey.stations.dup
    @journey_log.dup
  end 

  private :current_journey

end

#issue right now that travelling_journey instance variable is not unique so each array element is the same in IRB must fix 
#pot solution is to adjust the journey class so each object has a unique hash which can be put into the array 