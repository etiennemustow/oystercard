require 'oystercard'
require 'station'

class Journey

attr_reader :station
attr_reader :end_station

def initialize(entry_station)
  @journey = {entry_station: entry_station}
end

def entry_station
  @journey[:entry_station]
end




end
