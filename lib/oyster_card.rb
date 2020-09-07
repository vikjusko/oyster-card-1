class OysterCard
    attr_reader :balance 
    OYSTER_LIMIT = 20
    def initialize
        @balance = 0
    end

    def top_up(amount)
        raise 'Maximum Limit' if amount + balance > OYSTER_LIMIT
        @balance += amount
    end

end
