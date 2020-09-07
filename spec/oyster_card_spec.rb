require 'oyster_card'

describe OysterCard do
    it "Balance of oyster card equals 0" do
        expect(subject.balance).to eq 0
    end
    
    it "Top up oyster card with £2" do
        expect{subject.top_up(2)}.to change{(subject.balance)}.by(2)
    end
    
    it "Limit for oyster card £90" do
        limit = OysterCard::OYSTER_LIMIT
        subject.top_up(limit)  
       expect{subject.top_up(90) }.to raise_error("Maximum Limit")      
    end 

    it "Deduct £2 from oyster card" do
        subject.top_up(10)
        expect{subject.deduct(5)}.to change{(subject.balance)}.from(10).to(5)
    end

    it "Touch in oyster should show true for in_journey?" do
        subject.touch_in
        expect{subject.in_journey?}.to be true
    end

end    