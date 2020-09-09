require "oyster_card"

describe OysterCard do
  let(:entry_station) { double :station }
  let(:card) { OysterCard.new(10) }
  let(:exit_station) { double :station }

  describe "variable states" do
    it "Balance of oyster card equals 0" do
      expect(subject.balance).to eq 0
    end

    it "checks that the list_of_journey is empty by default" do
      expect(card.list_of_journey).to be_empty
    end
  end

  describe "#top_up" do
    it "Top up oyster card with £2" do
      expect { card.top_up(2) }.to change { (card.balance) }.by(2)
    end

    it "Limit for oyster card £90" do
      expect { subject.top_up(OysterCard::OYSTER_LIMIT + 1) }.to raise_error("Maximum Limit exceeded!")
    end
  end

  it "Deduct £5 from oyster card" do
    expect { card.send(:deduct, 5) }.to change { (card.balance) }.from(10).to(5)
  end

  describe "#touch_in" do
    it "Touch in oyster should show true for in_journey?" do
      card.touch_in(entry_station)
      expect(card.in_journey?).to be true
    end

    it "does oyster card show error if there is no balance" do
      expect { subject.touch_in(entry_station) }.to raise_error "No Money"
    end

    it "store entry station" do
      card.touch_in(entry_station)
      expect(card.entry_station).to eq entry_station
    end
  end

  describe "#touch_out" do
    it "Touch out oyster should show false for in_journey?" do
      subject.touch_out(exit_station)
      expect(subject.in_journey?).to be false
    end

    it "we have the correct balance after touching out" do
      expect { subject.touch_out(exit_station) }.to change { (subject.balance) }.by(-(OysterCard::MINIMUM_LIMIT))
    end
  end

  describe "adds entry and exit stations to a hash" do
    it "store entry station at touch in" do
      card.touch_in(entry_station)
      expect(card.current_journey).to have_value(entry_station)
    end

    it "store exit station at touch in" do
      card.touch_out(exit_station)
      expect(card.current_journey).to have_value(exit_station)
    end
  end
end
