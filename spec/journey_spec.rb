require 'journey'

describe Journey do
 let(:station) { double :station }
 let(:zone ) { double :zone}

 it 'store start of journey' do
    subject.start(station, zone)
    expect(subject.stations["entry_station"]).to eq station
 end    

 it 'store end of journey' do
   subject.end(station, zone) 
   expect(subject.stations["exit_station"]).to eq station 
 end

 it 'Checks to see if journey is completed' do
   subject.start(station,zone)
   subject.end(station, zone)
   expect(subject.complete?).to eq true
 end

 it 'fare should return a correct fare' do 
  subject.start(station, 1)
  subject.end(station, 3)
  expect(subject.fare).to eq 2
 end

 it 'should return a minimum fare if travelling in the same zone' do 
  subject.start(station, 1)
  subject.end(station, 1)
  expect(subject.fare).to eq 1
 end 
  
 it 'Gives penalty when journey is incomplete' do
  subject.start(station, zone)
  expect(subject.fare).to eq(Journey::PENALTY_FARE)
 end
end