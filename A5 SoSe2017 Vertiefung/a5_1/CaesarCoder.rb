class CaesarCoder
  def initialize(original_datei,schluessel_zeichen)
    @original_datei = original_datei
    @schluessel = schluessel_zeichen
  end

  #TODO
  def encode_file
  
  end

  # calculate encoded letter's bytecode
  def encode(byte,sz = @schluessel)           # given are the to be encoded bytecode and the key
    # only letters will be encoded, numbers & special characters won't
    if ('A'..'Z').include?(byte.chr) || ('a'..'z').include?(byte.chr)
      start = (byte > 96) ? 'a'.ord : 'A'.ord       # determine the start-value for decoding a-z & A-Z
      anzahl_zeichen = 26                           # das deutsche Alphabet
      abstand = sz.ord - byte.ord                   # "displacement"

      (byte + abstand - start) % anzahl_zeichen + start
    else
      byte
    end

  end
  
  #TODO
  def decode_file

  end


end


cc = CaesarCoder.new("a5_1/plain.txt","C")
cc.encode_file
cc.decode_file

puts cc.encode('a'.ord,'d'.ord)