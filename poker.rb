class Card
    def initialize(number, suit)
        @card_name = "#{number}#{suit}"
        @card_value = "#{number}"
        case number
        when "T"
            @card_value = "10"
        when "J"
            @card_value = "11"
        end
    end
    attr_reader :card_value
    attr_reader :card_name
end