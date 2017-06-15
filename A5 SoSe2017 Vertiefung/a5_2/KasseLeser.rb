require_relative "Kasse"

class KasseLeser
  
  def self.lese_kasse_von(datei_name)   
    kasse = Kasse.new

    # read each line (1 line ~ 1 Rechnung)
    File.open(datei_name, 'r').each_line { |line|
      # only read valid lines
      unless line.chomp.empty?
        # create an array of positions(product+preis) from each line (through splitting the line with '||')
        rechnung_ary = line.strip.squeeze(' ').split('||')

        #create a new Rechnung
        rechnung = Rechnung.new(Integer(rechnung_ary[0]))
        (1...rechnung_ary.size).each { |i|
          # create position_ary from each elem of rechnung_ary(\[0]) (through splitting an elem of rechnung_ary with ';')
          position_ary = rechnung_ary[i].split(';')

          # add (produkt, preis) into rechnung
          produkt = position_ary[0].strip
          preis = Integer(position_ary[1])

          rechnung << Position.new(produkt,preis)
        }

        # add new rechnung to kasse
        kasse << rechnung
      else
        puts 'Leerzeile ueberlesen'
      end
    }

    kasse
  end

end

# puts Integer('42')
# # puts Integer('hi')
# puts 'hi'.to_i

puts KasseLeser.lese_kasse_von('rechnungen.sv')
