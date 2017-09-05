class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

  attr_reader :balance
  attr_reader :entry_station

  def initialize
    @balance = 0
    @minimum = MINIMUM_BALANCE
  end

  def top_up(amount)
  fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
   @balance += amount
  end

  def touch_in(entry_station)
    raise "Insufficient funds to touch in" if insufficient_funds?
    @entry_station = entry_station
    return "You've touched in"
  end

  def touch_out
    @entry_station = nil
    deduct(@minimum)
    return "You've touched out"
  end

  def in_journey?
    !!@entry_station
  end

  def insufficient_funds?
    @balance <= @minimum
  end

  def check_balance
    @balance
  end

  private

  def deduct(fare)
    @balance -= fare
  end


end
