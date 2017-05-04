def dezimal_ziffer?(char)
  ('0'..'9').include?(char)
end

def oktal_ziffer?(char)
  ('0'..'7').include?(char)
end

def hexadezimal_ziffer?(char)
  ('0'..'9').include?(char) || ('A'..'F').include?(char.upcase)
end

def dezimal?(string)
  # make sure string doesn't start with '0'
  return false if string[0] == '0'

  # make sure every char is decimal
  string.each_char{|c|
    return false unless dezimal_ziffer?(c)
  }

  # all good
  true
end

def oktal?(string)
  # make sure string starts with '0'
  return false unless string[0] == '0'

  # make sure every char is octal
  string.each_char { |c|
    return false unless oktal_ziffer?(c)
  }

  # all good
  true
end

def hexadezimal?(string)
  # make sure string starts with '0x'
  return false unless string[0,2] == '0x'

  # make sure every (remaining) char is hexadecimal
  string[2...string.length].each_char{|c|
    return false unless hexadezimal_ziffer?(c)
  }

  # all good
  true
end

puts 'Wir analysieren die Eingabe auf ganzzahlige Werte im Dezimal- / Oktal- und Hexadezimalsystem'
while true
  puts 'Geben Sie eine Zahl in Dezimal- / Oktal- und Hexadezimaldarstellung ein'
  input = gets.chomp

  # nominalisieren
  string = input.strip.downcase

  if string == 'exit'
    puts 'Bis zum naechsten Mal'
    exit
  elsif dezimal?(string)
    puts "#{string} ist eine Zahl in Dezimalsystem"
  elsif oktal?(string)
    puts "#{string} ist eine Zahl in Oktalsystem"
  elsif hexadezimal?(string)
    puts "#{string} ist eine Zahl in Hexadezimalsystem"
  else
    puts "#{string} ist keine Zahl in Dezimal- / Oktal- oder Hexadezimalsystem"
  end
end