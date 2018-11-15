
class Deck #establishes deck and cards
    VALUE = %i[two three four five six seven eight nine ten jack queen king ace]
    SUITS = %i[heart club diamond spade]

    Card = Struct.new(:value, :suit)
    VALUE.flat_map {|val| SUITS.map {|suit| Card.new(val, suit)}}
end

class Hand #deals hands, returns array with all valued info
end

class ChickenDinner #finds winner
    include Comparable
end