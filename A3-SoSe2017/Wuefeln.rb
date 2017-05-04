def gewuerfelt?(zahl,von,bis)
  rand(von..bis) == zahl
end

#def gewinner_nummer(zahl,folge)
#  player_num = 1
#  while true
#    bingo = 0
#    folge.times{
#      break unless gewuerfelt?(zahl,1,6)
#      bingo += 1
#    }
#    if bingo == folge
#      return player_num
#    else
#      player_num += 1
#    end
#  end
#end
#
#puts "Die #{gewinner_nummer(3,3)}.Person gewinnt"
#puts "Die #{gewinner_nummer(3,5)}.Person gewinnt"
#puts "Die #{gewinner_nummer(3,10)}.Person gewinnt"

10.times do
  puts gewuerfelt?(4,1,9)
end