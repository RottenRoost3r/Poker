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

class Hand
    def initialize()
        @hand = []
    end

    def deal(card)
        @hand << card
    end
    attr_reader :hand
end

class Deck
    def initialize()
        @deck = []
        card_value = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
        card_shape = ['H', 'S', 'C', 'D']
        card_shape.each do |shape|
            card_value.each do |val|
                @deck << Card.new(val, shape)
            end
            @deck
        end
    end

    def shuffle_deck()
        @deck.shuffle!
    end

    def deal_hand()
        shuffle_deck()
        y = Hand.new
        5.times do
            y.deal(@deck.pop())
        end
        return y
    end
    attr_reader :deck
end

class Rules
    attr_reader :temp_num
    attr_reader :temp_suit
    attr_reader :counter
    attr_reader :val
    attr_reader :black
    attr_reader :white
    def initialize()
        @temp_suit = []
        @temp_num = []
    end

    def prepare_cards(hand) #splits the hand into 2 arrays, one for suit and the other for value
        @temp_suit = []
        @temp_num = []
        hand.hand.each do |val|
            temp_suit << val.card_shape
            temp_num << val.card_value.to_i
        end
    end

    def dux_loop(array, num) #does a double loop on suit or value to tell how many are the same
        array.each do |val|
            counter = 0
            array.each do |val2|
                if val == val2
                    counter += 1
                end
            end
            if counter == num
                return true
            end
        end
        false 
    end

    def array_increments(step, array) #checks to see if values are incrementing (example = 1,2,3,4,5)
        sorted = array.sort
        lastNum = array[0]
        sorted[1, sorted.count].each do |v|
            if lastNum + step != v
                return false
            end
            lastNum = v
        end
        true
    end

    def straight_flush(hand)
        prepare_cards(hand)
        if temp_suit.all? {|val| val == temp_suit[0] && array_increments(1, temp_num)}
            return true
        end
        false
    end

    def four_of_a_kind(hand)
        prepare_cards(hand)
        dux_loop(temp_num, 4) 
    end

    def full_house(hand)
        prepare_cards(hand)
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter += 1
                end
            end
            if counter == 3
                temp_num.delete(val)
                if temp_num[0] == temp_num[1]
                    return true
                end
            end
        end
        false
    end

    def full_house_high_card(hand)
        prepare_cards(hand)
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter += 1
                end
            end
            if counter == 3
                return val
            end
        end
    end

    def flush(hand)
        prepare_cards(hand)
        dux_loop(temp_suit, 5)
    end

    def straight(hand)
        prepare_cards(hand)
        array_increments(1, temp_num)
    end

    def three_of_a_kind(hand)
        prepare_cards(hand)
        dux_loop(temp_num, 3)
    end

    def two_pair(hand)
        prepare_cards(hand)
        array1 = []
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter +=1
                end
            end
            if counter == 2
                array1 << val
                temp_num.delete(val)
            end
        end
            if array1.length == 2
                return true
            end
        false
    end

    def two_pair_high_card_one(hand)
        prepare_cards(hand)
        array1 = []
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter +=1
                end
            end
            if counter == 2
                array1 << val
                temp_num.delete(val)
            end
        end
        return array1.sort().last
    end

    def two_pair_high_card_two(hand)
        prepare_cards(hand)
        array1 = []
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter +=1
                end
            end
            if counter == 2
                array1 << val
                temp_num.delete(val)
            end
        end
        return array1.sort().first
    end

    def two_pair_high_card_three(hand)
        prepare_cards(hand)
        array1 = []
        temp_num.each do |val|
            temp_num.each do |val2|
                if val == val2
                    temp_num.delete(val)
                end
            end
        end
        return temp_num.last
    end

    def pair(hand)
        prepare_cards(hand)
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter += 1
                end
            end
            if counter == 2
                return true
            end
        end
        false 
    end

    def pair_high_card(hand)
        prepare_cards(hand)
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter += 1
                end
            end
            if counter == 2
                return val
            end
        end
    end

    def pair_high_card_two(hand)
        prepare_cards(hand)
        temp_num.each do |val|
            counter = 0
            temp_num.each do |val2|
                if val == val2
                    counter += 1
                end
            end
            if counter == 2
                temp_num.delete(val)
            end
        end
        return temp_num.sort()
    end

    def high_card(hand)
        prepare_cards(hand)
        return temp_num.sort()
    end

    def ranking(hand)
        values = {pair(hand) => 1, two_pair(hand) => 2, three_of_a_kind(hand) => 3, straight(hand) => 4, flush(hand) => 5, full_house(hand) => 6, four_of_a_kind(hand) => 7, straight_flush(hand) => 8}
        rank = 0
        values.each do |key, value|
            if key 
                rank = value
            end
        end
        return rank
    end

    def comparison(black, white)



        if ranking(white) > ranking(black)
            return "White Wins"
        elsif ranking(white) < ranking(black)
            return "Black Wins"
        end
    
    
    
    
        if ranking(white) == 2 && ranking(black) == 2 && two_pair_high_card_one(white) == two_pair_high_card_one(black) && two_pair_high_card_two(white) == two_pair_high_card_two(black) && two_pair_high_card_three(white) == two_pair_high_card_three(black)
            return "It's a Tie"
        end
    
    
        if two_pair_high_card_three(white) > two_pair_high_card_three(black)
            return "White Wins"
        else
            return "Black Wins"
        end
    
    
        
    
    
        if two_pair_high_card_two(white) > two_pair_high_card_two(black)
            return "White Wins"
        else 
            return "Black Wins"
        end
    
    
        if two_pair_high_card_one(white) > two_pair_high_card_one(black)
            return "White Wins"
        else
            return "Black Wins"
        end
    
    
    
    
    
        if ranking(white) == 6 && ranking(black) == 6 && full_house_high_card(white) > full_house_high_card(black)
            return "White Wins"
        else
            return "Black Wins"
        end
    
    
    
        if ranking(white) == 1 && ranking(black) == 1 && pair_high_card(white) == pair_high_card(black) && pair_high_card_two(white)[2] == pair_high_card_two(black)[2] && pair_high_card_two(white)[1] == pair_high_card_two(black)[1] && if pair_high_card_two(white)[0] == pair_high_card_two(black)[0]
            return "It's a Tie"
        end
    
    
    
        if pair_high_card_two(white)[0] > pair_high_card_two(black)[0]
            return "White Wins"
        else
            return "Black Wins"
        end
    
        if pair_high_card_two(white)[1] > pair_high_card_two(black)[1]
            return "White Wins"
        else
            return "Black Wins"
        end
    
    
    
        if pair_high_card_two(white)[2] > pair_high_card_two(black)[2]
            return "White Wins"
        else
            return "Black Wins"
        end
    
    
        if pair_high_card(white) > pair_high_card(black)
            return "White Wins"
        else pair_high_card(white) > pair_high_card(black)
            return "Black Wins"
        end

        if ranking(white) == 0 && ranking(black) == 0 && high_card(white)[4] == high_card(black)[4] && high_card(white)[3] == high_card(black)[3] && high_card(white)[2] == high_card(black)[2] && high_card(white)[1] == high_card(black)[1] && high_card(white)[0] == high_card(black)[0]
            return "It's a Tie"
        elsif high_card(white)[0] > high_card(black)[0] && high_card(white)[1] == high_card(black)[1] && high_card(white)[2] == high_card(black)[2] && high_card(white)[3] == high_card(black)[3] && high_card(white)[4] == high_card(black)[4]
            return "White Wins"
        elsif high_card(white)[0] < high_card(black)[0] && high_card(white)[1] == high_card(black)[1] && high_card(white)[2] == high_card(black)[2] && high_card(white)[3] == high_card(black)[3] && high_card(white)[4] == high_card(black)[4]
            return "Black Wins"
        elsif high_card(white)[1] > high_card(black)[1] && high_card(white)[2] == high_card(black)[2] && high_card(white)[3] == high_card(black)[3] && high_card(white)[4] == high_card(black)[4]
            return "White Wins"
        elsif high_card(white)[1] < high_card(black)[1] && high_card(white)[2] == high_card(black)[2] && high_card(white)[3] == high_card(black)[3] && high_card(white)[4] == high_card(black)[4]
            return "Black Wins"
        elsif high_card(white)[2] > high_card(black)[2] && high_card(white)[3] == high_card(black)[3] && high_card(white)[4] == high_card(black)[4]
            return "White Wins"
        elsif high_card(white)[2] < high_card(black)[2] && high_card(white)[3] == high_card(black)[3] && high_card(white)[4] == high_card(black)[4]
            return "Black Wins"
        elsif high_card(white)[3] > high_card(black)[3] && high_card(white)[4] == high_card(black)[4]
            return "White Wins"
        elsif high_card(white)[3] < high_card(black)[3] && high_card(white)[4] == high_card(black)[4]
            return "Black Wins"
        elsif high_card(white)[0] > high_card(black)[0] 
            return "White Wins"
        elsif high_card(white)[0] < high_card(black)[0]
            return "Black Wins"
        elsif high_card(white)[1] > high_card(black)[1]
            return "White Wins"
        elsif high_card(white)[1] < high_card(black)[1]
            return "Black Wins"
        elsif high_card(white)[2] > high_card(black)[2]
            return "White Wins"
        elsif high_card(white)[2] < high_card(black)[2]
            return "Black Wins"
        elsif high_card(white)[3] > high_card(black)[3]
            return "White Wins"
        elsif high_card(white)[3] < high_card(black)[3]
            return "Black Wins"
        elsif high_card(white)[4] > high_card(black)[4]
            return "White Wins"
        elsif high_card(white)[4] < high_card(black)[4]
            return "Black Wins"
        end
        
    end
    
    
    
   



end
    
    
   

    def how_they_win(hand)
        if ranking(hand) == 8
            return "Straight Flush"
        elsif ranking(hand) == 7
            return "Four of a Kind"
        elsif ranking(hand) == 6
            return "Full House"
        elsif ranking(hand) == 5
            return "Flush"
        elsif ranking(hand) == 4
            return "Straight"
        elsif ranking(hand) == 3
            return "Three of a Kind"
        elsif ranking(hand) == 2
            return "Two Pair"
        elsif ranking(hand) == 1
            return "Pair"
        elsif ranking(hand) == 0
            return "High Card"
        end
    end

    def play_game()
        x = Deck.new
        @black = x.deal_hand()
        @white = x.deal_hand()
        return comparison(black, white)
    end
   attr_reader :black
   attr_reader :white
end



class Hand #returns array with all valued info
    def initialize()
        @cards = []
    end

    def <<(other_card)
        @cards << other_card
    end

    def prepare_cards()
        @value_arr = []
        @suit_arr = []
        @cards.each do |v|
            suit_arr << v.suit.to_s
            value_arr << v.value.to_i
        end
    end

    def array_increments(array) #checks to see if values are incrementing (example = 1,2,3,4,5)
        array.sort.each_cons(2).all? {|x,y| y == x + 1}
    end

    def matcher(num)
        temp_arr = []
        @cards.each do |v|
            temp_arr << v.value.to_s
        end
        temp_arr.each do |v|
            if temp_arr.count(v) == num
                return 1
            end
        end
        0
    end

    def pair()
        matcher(2)
    end

    def three_of_a_kind()
        matcher(3)
    end

    def four_of_a_kind()
        matcher(4)
    end

    def two_pair()
        prepare_cards()
        y = []; is = true; wrong = false
        value_arr.each do |v|
            value_arr.count(v) == 2 ?  y << v : false
        end
        z = value_arr.select { |k| y[0] != k} 
        z.each do |v|
            z.count(v) == 2 ? y << is : y << wrong 
        end
        return y.include?(true) == true ? 1 : 0
    end

    def full_house()
        matcher(2) && matcher(3) ? 1 : 0
    end

    def flush()
        prepare_cards()
        suit_arr.uniq.count == 1 ? 1 : 0
    end

    def straight()
        prepare_cards()
        array_increments(value_arr) == true ? 1 : 0
    end

    def straight_flush()
        straight() && flush() == 1 ? 1 : 0
    end

    def high_hand(hand)
        prepare_cards()
        return @value_arr.sort.join.to_i
    end

    def score()
        prepare_cards()
        [straight_flush(), four_of_a_kind(), full_house(), flush(), straight(), three_of_a_kind(), two_pair(), pair(), high_hand(value_arr)].join
    end

    def play_game()
        x = Deck.new
        m = Hand.new
        @black = x.deal_hand()
        @white = x.deal_hand()
        puts white.score()
        puts black.score()
    end
    attr_reader :suit
    attr_reader :shuffled
    attr_reader :black
    attr_reader :white
    attr_reader :value_arr
    attr_reader :suit_arr
end
m = Hand.new
m.play_game()
