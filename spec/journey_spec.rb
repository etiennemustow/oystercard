require 'journey'

describe Journey do

  context 'given an entry station' do
    subject {described_class.new("station")}

    it 'has an entry station' do
     expect(subject.entry_station).to eq("station")
    end
  end
end
