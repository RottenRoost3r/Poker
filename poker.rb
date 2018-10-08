class Card
    def initialize(number, suit)
        @card_name = "#{number}#{suit}"
        @card_value = "#{number}"
        @card_shape = "#{suit}"
        case number
        when "T"
            @card_value = "10"
        when "J"
            @card_value = "11"
        when "Q"
            @card_value = "12"
        when "K"
            @card_value = "13"
        when "A"
            @card_value = "14"
        end

        case suit
        when "H"
            @card_shape = "Hearts"
        when "S"
            @card_shape = "Spades"
        when "C"
            @card_shape = "Clubs"
        when "D"
            @card_shape = "Diamonds"
        end
    end
    attr_reader :card_value
    attr_reader :card_name
    attr_reader :card_shape
end