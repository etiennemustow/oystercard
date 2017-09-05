require 'journey'

describe Journey do
  
  subject {described_class.new("Poplar")}

  it 'knows its entry station' do
   expect(subject.entry_station).to eq("Poplar")
  end


end
