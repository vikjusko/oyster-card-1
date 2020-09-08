class OysterCard
    attr_reader :balance, :entry_station
    OYSTER_LIMIT = 20
    MINIMUM_LIMIT = 1
    
    def initialize
        @balance = 0
    end

    def top_up(amount)
        raise 'Maximum Limit' if amount + balance > OYSTER_LIMIT
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

    def in_journey?
    !!@entry_station
    end    

    def touch_in(station)
     @entry_station = station   
     fail "No Money" if @balance < MINIMUM_LIMIT    
    end    

    def touch_out
      @entry_station = nil  
      deduct(MINIMUM_LIMIT)
    end    

    private :deduct

end


