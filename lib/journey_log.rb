require_relative 'journey'

class JourneyLog
  attr_reader :journey, :travelling_journey, :journey_log 
  def initialize(journey = Journey.new)
    @journey = journey
    @travelling_journey = {}
    @journey_log = []
  end

  def start(station)
    @journey.start(station)
  end 

  def current_journey
    !!@journey.entry_station == true ? @travelling_journey['start_station'] = @journey.entry_station : @journey = Journey.new
    # @travelling_journey
    # if !!@journey.entry_station == true do 
    #   @travelling_journey['start_station'] = @journey.entry_station
    # else
    #   @journey = Journey.new
    #   break
    # end 
  end 

  def finish(station)
    self.current_journey
    @travelling_journey['exit_station'] = station 
    @journey_log << @travelling_journey
    @journey = Journey.new
  end 

  def journeys
    @journey_log
  end 

  private :current_journey

end

#issue right now that travelling_journey instance variable is not unique so each array element is the same in IRB must fix 
#pot solution is to adjust the journey class so each object has a unique hash which can be put into the array 