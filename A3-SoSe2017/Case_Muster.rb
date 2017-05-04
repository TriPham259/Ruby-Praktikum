require './Muster.rb'

puts 'Willkommen in der Musterfabrik'
while true
  puts 'Geben Sie eine Zahl ein um ein Muster auszuwaehlen oder \'exit\' um das Programm zu beenden'
  puts '1:Kreuz'
  puts '2:Dreieck links'
  puts '3:Dreieck rechts'
  puts '4:gleichschenkliges Dreieck'
  
  wahl = gets
  wahl.strip!.downcase!
  
puts wahl
  if !%w[1 2 3 4 exit].include?(wahl)
    puts "ungueltige Eingabe"
  elsif wahl == 'exit'
    puts 'Tschuess. Die Druckerei geht in die Osterferien'
    exit
  else
    wahl = wahl.to_i

    puts 'Geben Sie eine ungerade ganze Zahl fuer Zeilen/Spalten des Musters ein:'
    n = gets.chomp.to_i
    puts 'Geben Sie ein Muster ein'
    chars = gets.chomp
    case wahl
      when 1 then kreuz(n,chars)
      when 2 then dreieck1(n,chars)
      when 3 then dreieck2(n,chars)
      else dreieck3(n,chars)
    end
  end
    

end