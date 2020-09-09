class OysterCard
    attr_reader :balance, :entry_station, :list_of_journey, :current_journey
    OYSTER_LIMIT = 90
    MINIMUM_LIMIT = 1
    BALANCE = 0
    def initialize(balance = BALANCE)
        @balance = balance
        @entry_station = nil
        @list_of_journey = []
        @current_journey = { "entry_station" => nil, "exit_station" => nil }
    end

    def top_up(amount)
        raise 'Maximum Limit exceeded!' if amount + balance > OYSTER_LIMIT
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
     @current_journey["entry_station"] = :station
     fail "No Money" if @balance < MINIMUM_LIMIT    
    end    

    def touch_out(station)
      @entry_station = nil  
      deduct(MINIMUM_LIMIT)
    end    

    private :deduct

end


