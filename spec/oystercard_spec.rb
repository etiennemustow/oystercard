require 'oystercard'

describe Oystercard do

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }
  end

    it 'raises an error if the maximum balance is exceeded' do
     maximum_balance = Oystercard::MAXIMUM_BALANCE
     subject.top_up(maximum_balance)
     expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end

  describe '#deduct' do
    it 'deducts from balance' do
    subject.top_up 20
    expect { subject.instance_eval {deduct(1) } }.to change { subject.check_balance }.by -1
    end
   end

  describe '#touch_in' do
    let(:entry_station) {double :entry_station}

    it "is initially not in a journey" do
    expect(subject).not_to be_in_journey
  end

  it "can be touched in" do
    subject.top_up 50
    subject.touch_in(entry_station)
    expect(subject).to be_in_journey
  end

  it "remembers the entry station" do
    subject.top_up 50
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station
  end

  it "raises an error if touched in with minimum balance" do
    expect{ subject.touch_in(entry_station)}.to raise_error "Insufficient funds to touch in"
  end
end

  describe '#touch_out' do
    let(:entry_station) {double :entry_station}

   it "can be touched out" do
    subject.top_up 50
    subject.touch_in(entry_station)
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "deducts the minimum fare when touched out" do
    subject.top_up 20
    subject.check_balance
    subject.touch_in(entry_station)
    subject.touch_out
    expect{ subject.touch_out}.to change{subject.check_balance}.by(-Oystercard::MINIMUM_BALANCE)
  end

end

  describe "#check_balance" do
    it "displays balance" do
      subject.top_up 50
      expect(subject.check_balance).to eq 50
    end
  end




end
