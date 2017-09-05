class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

  attr_reader :balance
  attr_reader :entry_station
  attr_reader :history
  attr_reader :exit_station

  def initialize
    @balance = 0
    @minimum = MINIMUM_BALANCE
    @history = []
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

  def touch_out(exit_station)
    current_journey = {entry_station: entry_station, exit_station: exit_station}
    @history << current_journey
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
