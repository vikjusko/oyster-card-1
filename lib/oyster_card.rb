class OysterCard
    attr_reader :balance, :status 
    OYSTER_LIMIT = 20
    MINIMUM_LIMIT = 1
    
    def initialize
        @balance = 0
        @status = false
    end

    def top_up(amount)
        raise 'Maximum Limit' if amount + balance > OYSTER_LIMIT
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

    def in_journey?
    @status
    end    

    def touch_in
     fail "No Money" if @balance < MINIMUM_LIMIT    
    @status = true
    end    

    def touch_out
      deduct(MINIMUM_LIMIT)
      @status = false
    end    

    private :deduct

end


