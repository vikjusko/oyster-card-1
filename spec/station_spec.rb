require "oyster_card"
require "station"

describe Station do
  let(:station) { Station.new("waterloo", 1) }
  it "checks to see if it has a name" do
    expect(station.name).to eq "waterloo"
  end

  it "checks to see if it has a zone" do
    expect(station.zone).to eq 1
  end
end
