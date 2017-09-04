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
    it { is_expected.to respond_to(:deduct).with(1).argument }
  end


  it "is initially not in a journey" do
    expect(subject).not_to be_in_journey
  end

  it "can be touched in" do
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it "can be touched out" do
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

end
