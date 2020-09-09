require 'oyster_card'

describe OysterCard do
    let(:station) { double :station }
    let(:card)    { OysterCard.new(10)}
    let(:station_2) { double :station }

    it "Balance of oyster card equals 0" do
        expect(subject.balance).to eq 0
    end
    
    it "Top up oyster card with £2" do
        expect{card.top_up(2)}.to change{(card.balance)}.by(2)
    end
    
    it "Limit for oyster card £90" do 
       expect{subject.top_up(OysterCard::OYSTER_LIMIT + 1) }.to raise_error("Maximum Limit exceeded!")      
    end 

    it "Deduct £5 from oyster card" do
        expect{card.send(:deduct, 5)}.to change{(card.balance)}.from(10).to(5)
    end

    it "Touch in oyster should show true for in_journey?" do
        card.touch_in(station)
        expect(card.in_journey?).to be true
    end

    it "Touch out oyster should show false for in_journey?" do
        subject.touch_out(station_2)
        expect(subject.in_journey?).to be false
    end    

    it "does oyster card show error if there is no balance" do
        expect{subject.touch_in(station)}.to raise_error"No Money"
    end

    it 'we have the correct balance after touching out' do 
      expect {subject.touch_out(station_2)}.to change{(subject.balance)}.by(-(OysterCard::MINIMUM_LIMIT))
    end 

    it "store entry station" do
        card.touch_in(station)
    expect(card.entry_station).to eq station
    end

    it "store entry station at touch in" do
        card.touch_in(station)
    expect(card.current_journey).to have_value(:station)
    end     

end    