require 'journey'

describe Journey do
 let(:station) { double :station }

 it 'store start of journey' do
    subject.start(station)
    expect(subject.stations["entry_station"]).to eq station
 end    

 it 'store end of journey' do
   subject.end(station) 
   expect(subject.stations["exit_station"]).to eq station 
 end

 it 'Checks to see if journey is completed' do
   subject.start(station)
   subject.end(station)
   expect(subject.complete?).to eq true
 end

 it 'fare should return minimum fare' do 
  subject.start(station)
  subject.end(station)
  expect(subject.fare).to eq(Journey::MINIMUM_FARE)
 end

 it 'Gives penalty when journey is incomplete' do
  subject.start(station)
  expect(subject.fare).to eq(Journey::PENALTY_FARE)
 end
end