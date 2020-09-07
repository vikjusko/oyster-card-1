class OysterCard
    attr_reader :balance, :status 
    OYSTER_LIMIT = 20
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
    @status = true
    end    

    def touch_out
    @status = false
    end    

end


