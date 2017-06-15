Dir.chdir(File.dirname(__FILE__))  # change current directory to the same directory as the .rb file
require_relative 'CaesarCoder'

require 'test/unit'


class CaesarCoderTest < Test::Unit::TestCase
  def setup
    @filename_orig = 'plain.txt'
    @filename_encoded = 'encoded_plain.txt'
    @filename_decoded = 'decoded_plain.txt'
    @ccc = CaesarCoder.new('plain.txt','C')
    @encoded_strings = "C D E F G H I J K L M N O P Q R S T U V W X Y Z A B
MNQRR XGTNCGUUV FQTVOWPF -- CNU PCEJHQNIGT YKTF VWEJGN IGJCPFGNV."

    @distance_c = 'C'.ord-'A'.ord
    @encoded_A = 'C'.ord
    @encoded_Z = 'B'.ord
    @encoded_X = 'Z'.ord
    @encoded_G = 'I'.ord
    @encoded_space = ' '.ord
    @encoded_a = 'c'.ord
    @encoded_z = 'b'.ord
    @encoded_x = 'z'.ord
    @encoded_g = 'i'.ord
  end

  def test_encode
    assert_equal(@encoded_A,@ccc.encode('A'.ord))
    assert_equal(@encoded_Z,@ccc.encode('Z'.ord))
    assert_equal(@encoded_X,@ccc.encode('X'.ord))
    assert_equal(@encoded_G,@ccc.encode('G'.ord))
      puts 'a'.ord
    assert_equal(@encoded_a,@ccc.encode('a'.ord))
    assert_equal(@encoded_z,@ccc.encode('z'.ord))
    assert_equal(@encoded_x,@ccc.encode('x'.ord))
    assert_equal(@encoded_g,@ccc.encode('g'.ord))
    assert_equal(@encoded_space,@ccc.encode(' '.ord))
  end

  def test_encode_file
    @ccc.encode_file
    assert_equal(@encoded_strings,read_file_content(@filename_encoded),'encoding with distance "C" does not match')
  end

  def test_decode_file
    @ccc.encode_file
    @ccc.decode_file
    assert_equal(read_file_content(@filename_orig),read_file_content(@filename_decoded),'decoding doesnt match the original')
  end

  def read_file_content(filename)
    file = File.open(filename, 'r')
    content = file.read
    puts content
    file.close

    content
  end

end