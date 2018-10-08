class Card
    def initialize(number, suit)
        @card_name = "#{number}#{suit}"
        @card_value = "#{number}"

    end
    attr_reader :card_value
end