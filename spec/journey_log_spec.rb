require 'journey_log'

describe JourneyLog do
  let(:station) { double :station }
  describe '#start' do
    it 'starts a new journey' do 
      subject.start(station)
      expect(subject.journey.entry_station).to eq station 
    end 
  end 

  describe '#current_journey' do
    it 'returns incomplete journey (same as just the entry station)' do
      subject.start(station)
      expect(subject.send(:current_journey)).to eq subject.travelling_journey['start_station'] = station
    end 
  end

  describe '#finish' do
    it 'adds exist station to travelling journey hash' do
      subject.finish(station)
      expect(subject.travelling_journey['exit_station']).to eq station 
    end
  end 

  describe '#journeys' do
    it 'returns journey_log' do
      expect(subject.journeys).to eq subject.journey_log
    end
  end 

end