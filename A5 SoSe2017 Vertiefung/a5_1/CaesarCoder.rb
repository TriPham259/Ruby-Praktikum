Dir.chdir(File.dirname(__FILE__))  # change current directory to the same directory as the .rb file
class CaesarCoder
  attr_reader :original_datei, :schluessel_zeichen, :schluessel

  def initialize(original_datei,schluessel_zeichen)
    @original_datei = original_datei
    @schluessel_zeichen = schluessel_zeichen
    @schluessel = schluessel_zeichen.upcase.ord - 'A'.ord     # displacement
  end


  # calculate encoded letter's bytecode
  def encode(byte,sz = schluessel)           # given are the to be encoded bytecode and the key
    # only letters will be encoded, numbers & special characters won't
    if ('A'..'Z').include?(byte.chr) || ('a'..'z').include?(byte.chr)
      start = (byte > 96) ? 'a'.ord : 'A'.ord       # determine the start-value for decoding a-z & A-Z
      anzahl_zeichen = 26                           # das deutsche Alphabet

      (byte + sz - start) % anzahl_zeichen + start
    else
      byte
    end
  end

  # read from 'original', write to 'encoded'
  def encode_file
    # open 'orginal' to read from
    # fr = File.open("#{original_datei}", 'r') dann muss die Datei explizit geschlossen werden
    File.open("#{original_datei}", 'r') {|fr|
      # create 'encoded' to write to
      File.open("encoded_#{original_datei}",'w') { |fw|
        # encode each letter and then write to 'encoded'
        fr.each_byte{|byte|
          fw << encode(byte).chr
        }
      }
    }
  end


  # read from 'encoded', write to 'decoded'. decode = encode w/ negative key
  def decode_file
    # Open 'encoded' to read from
    File.open("encoded_#{original_datei}",'r') { |fr|
      # Open 'decoded' to write to
      File.open("decoded_#{original_datei}",'w') { |fw|
        fr.each_byte { |byte|
          # "decode" each byte and write to 'decoded'
          fw << encode(byte, -schluessel).chr
        }
      }
    }

  end


end


cc = CaesarCoder.new('plain.txt','C')
cc.encode_file
cc.decode_file

# puts cc.encode('a'.ord,'d'.ord)