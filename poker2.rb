
class Deck #establishes deck and cards, deals hands
    VALUE = %i[two three four five six seven eight nine ten jack queen king ace]
    SUITS = %i[hearts clubs diamonds spades]
    
    Card = Struct.new(:value, :suit) do 
        def to_s #redefine to_s to return card names as string
            "#{value.capitalize} of #{suit.capitalize}"
        end
        def ==(other) #redefine == to check for value instead of id
            self.value == other.value &&
              self.suit == other.suit
          end
    end
    
   deck = VALUE.flat_map {|val| SUITS.map {|suit| Card.new(val, suit)}}
   shuffled = deck.shuffle

    hand = []

    5.times do
        hand << shuffled.pop().to_s
    end

    puts hand
   

  
end

class Hand_chopper  #returns array with all valued info
end

class ChickenDinner #finds winner
    include Comparable
end