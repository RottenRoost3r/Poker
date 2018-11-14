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
else
    return "Black Wins"
end





if ranking(white) == 0 && ranking(black) == 0 && high_card(white)[4] == high_card(black)[4] && high_card(white)[3] == high_card(black)[3] && high_card(white)[2] == high_card(black)[2] && high_card(white)[1] == high_card(black)[1] && high_card(white)[0] == high_card(black)[0]
    return "It's a Tie"
elsif high_card(white)[0] > high_card(black)[0] && high_card(white)[4] == high_card(black)[4] && high_card(white)[3] == high_card(black)[3] && high_card(white)[2] == high_card(black)[2] && high_card(white)[1] == high_card(black)[1]
    return "White Wins"
elsif high_card(white)[0] < high_card(black)[0] && high_card(white)[4] == high_card(black)[4] && high_card(white)[3] == high_card(black)[3] && high_card(white)[2] == high_card(black)[2] && high_card(white)[1] == high_card(black)[1] 
    return "Black Wins"
elsif high_card(white)[1] > high_card(black)[1] && high_card(white)[4] == high_card(black)[4] && high_card(white)[3] == high_card(black)[3] && high_card(white)[2] == high_card(black)[2]
    return "White Wins"
elsif high_card(white)[1] < high_card(black)[1] && high_card(white)[4] == high_card(black)[4] && high_card(white)[3] == high_card(black)[3] && high_card(white)[2] == high_card(black)[2]
    return "Black Wins"
elsif high_card(white)[2] > high_card(black)[2] && high_card(white)[4] == high_card(black)[4] && high_card(white)[3] == high_card(black)[3]
    return "White Wins"
elsif high_card(white)[2] < high_card(black)[2] && high_card(white)[4] == high_card(black)[4] && high_card(white)[3] == high_card(black)[3]
    return "Black Wins"
elsif high_card(white)[3] > high_card(black)[3] && high_card(white)[4] == high_card(black)[4]
    return "White Wins"
elsif high_card(white)[3] < high_card(black)[3] && high_card(white)[4] == high_card(black)[4]
    return "Black Wins"
elsif high_card(white)[4] > high_card(black)[4] 
    return "White Wins"
elsif high_card(white)[4] < high_card(black)[4]
    return "Black Wins"
end






if high_card(white)[1] > high_card(black)[1]
    return "White Wins"
else
    return "Black Wins"
end


if high_card(white)[2] > high_card(black)[2]
    return "White Wins"
else
    return "Black Wins"
end

if high_card(white)[3] > high_card(black)[3]
    return "White Wins"
else 
    return "Black Wins"
end

if high_card(white)[4] > high_card(black)[4]
    return "White Wins"
else 
    return "Black Wins"
end




end


def comparison(black, white)
    if ranking(white) > ranking(black)
        return "White Wins"
    elsif ranking(white) < ranking(black)
        return "Black Wins"
    elsif ranking(white) == ranking(black)
        if ranking(white) == 2 && ranking(black) == 2
           if two_pair_high_card_one(white) == two_pair_high_card_one(black)
                if two_pair_high_card_two(white) == two_pair_high_card_two(black)
                    if two_pair_high_card_three(white) == two_pair_high_card_three(black)
                        return "It's a Tie"
                    else
                        if two_pair_high_card_three(white) > two_pair_high_card_three(black)
                            return "White Wins"
                        else
                            return "Black Wins"
                        end
                    end
                elsif two_pair_high_card_two(white) > two_pair_high_card_two(black)
                    return "White Wins"
                else 
                    return "Black Wins"
                end
            elsif two_pair_high_card_one(white) > two_pair_high_card_one(black)
                return "White Wins"
            else
                return "Black Wins"
            end
        end
    end
    if ranking(white) == 6 && ranking(black) == 6
        if full_house_high_card(white) > full_house_high_card(black)
            return "White Wins"
        else
            return "Black Wins"
        end
    end
    if ranking(white) == 1 && ranking(black) == 1
        if pair_high_card(white) == pair_high_card(black)
            if pair_high_card_two(white)[2] == pair_high_card_two(black)[2]
                if pair_high_card_two(white)[1] == pair_high_card_two(black)[1]
                    if pair_high_card_two(white)[0] == pair_high_card_two(black)[0]
                        return "It's a Tie"
                    else
                        if pair_high_card_two(white)[0] > pair_high_card_two(black)[0]
                            return "White Wins"
                        else
                            return "Black Wins"
                        end
                    end
                elsif pair_high_card_two(white)[1] > pair_high_card_two(black)[1]
                    return "White Wins"
                else
                    return "Black Wins"
                end
            elsif pair_high_card_two(white)[2] > pair_high_card_two(black)[2]
                return "White Wins"
            else
                return "Black Wins"
            end
        elsif pair_high_card(white) > pair_high_card(black)
            return "White Wins"
        else
            return "Black Wins"
        end
    end
    if ranking(white) == 0 && ranking(black) == 0 || ranking(white) == 5 && ranking(black) == 5 
        if high_card(white)[4] == high_card(black)[4]
            if high_card(white)[3] == high_card(black)[3]
                if high_card(white)[2] == high_card(black)[2]
                    if high_card(white)[1] == high_card(black)[1]
                        if high_card(white)[0] == high_card(black)[0]
                            return "It's a Tie"
                        elsif high_card(white)[0] > high_card(black)[0]
                            return "White Wins"
                        else
                            return "Black Wins"
                        end
                    elsif high_card(white)[1] > high_card(black)[1]
                        return "White Wins"
                    else
                        return "Black Wins"
                    end
                elsif high_card(white)[2] > high_card(black)[2]
                    return "White Wins"
                else
                    return "Black Wins"
                end
            elsif high_card(white)[3] > high_card(black)[3]
                return "White Wins"
            else 
                return "Black Wins"
            end
        elsif high_card(white)[4] > high_card(black)[4]
            return "White Wins"
        else 
            return "Black Wins"
        end
    end
end
