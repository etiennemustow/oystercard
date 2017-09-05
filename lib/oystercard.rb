class Oystercard

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

  attr_reader :balance
  attr_reader :in_use

  def initialize
    @balance = 0
    @in_use = false
    @minimum = MINIMUM_BALANCE
  end

  def top_up(amount)
  fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
   @balance += amount
  end

  def touch_in
    raise "Insufficient funds to touch in" if insufficient_funds?
    @in_use = true
    return "You've touched in"
  end

  def touch_out
    @in_use = false
    deduct(@minimum)
    return "You've touched out"
  end

  def in_journey?
    @in_use
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
