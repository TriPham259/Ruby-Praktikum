def matrix?(mat)
  return false unless mat.is_a?(Array)
  (0...(mat.size - 1)).all? {|z| mat[z].is_a?(Array) && mat[z].size == mat[z+1].size }  &&
      mat[mat.size - 1].is_a?(Array) && mat[mat.size - 1].size == mat[0].size
end

def gewichtet(mat)
  # sizes of mat
  zeile = mat.size
  spalte = mat[0].size

  ergebnis = Array.new(zeile){Array.new(spalte)}

  (0...zeile).cycle {|i|
    (0...spalte).cycle {|j|
      ergebnis[i][j] = (mat[i-1][j-1] + mat[i-1][j] + mat[i-1][j+1] + mat[i][j-1] + mat[i][j] + mat[i][j+1] + mat[i+1][j-1] + mat[i+1][j] + mat[i+1][j+1]) / 9
    }
  }

  ergebnis
end

# gegeben
def pp_mat(mat)
  mat.each { |zeile|
    zeile.each { |wert|
      printf("%3f ", wert)
    }
    puts
  }
  puts
end

puts matrix?(Array.new()) # false                                  1-dim
puts matrix?(Array.new(4){|zeile| Array.new(zeile +1)}) # false    Dreiecksmatrix [[nil],[nil,nil],[nil,nil,nil],[nil,nil,nil,nil]]
puts matrix?(Array.new(4,17)) # false                              1-dim, 4 elem/all are 17
puts matrix?([[1]]) # true                                         2-dim, 1x1
puts matrix?([[]]) # true                                          2-dim, 1x1
puts matrix?(Array.new(4){Array.new(3,1)}) # true                  2-dim, 4x3/all are 1


#
### Ergebnisse fuer gewichtet
# 

orig0 = Array.new(4){Array.new(3,1)}
pp_mat(orig0)
#1.000000 1.000000 1.000000
#1.000000 1.000000 1.000000
#1.000000 1.000000 1.000000
#1.000000 1.000000 1.000000
pp_mat(gewichtet(orig0))
#1.000000 1.000000 1.000000
#1.000000 1.000000 1.000000
#1.000000 1.000000 1.000000
#1.000000 1.000000 1.000000

orig1 = Array.new(4){|zeile| Array.new(3,zeile+1)}
pp_mat(orig1)
#1.000000 1.000000 1.000000
#2.000000 2.000000 2.000000
#3.000000 3.000000 3.000000
#4.000000 4.000000 4.000000

pp_mat gewichtet(orig1)
#2.333333 2.333333 2.333333
#2.000000 2.000000 2.000000
#3.000000 3.000000 3.000000
#2.666667 2.666667 2.666667

orig2 = Array.new(4){|zeile| Array.new(3) {|spalte| zeile +spalte +1}}
pp_mat(orig2)
#1.000000 2.000000 3.000000
#2.000000 3.000000 4.000000
#3.000000 4.000000 5.000000
#4.000000 5.000000 6.000000

pp_mat(gewichtet(orig2))
#3.333333 3.333333 3.333333
#3.000000 3.000000 3.000000
#4.000000 4.000000 4.000000
#3.666667 3.666667 3.666667

orig3 = Array.new(7){|zeile| Array.new(5) {|spalte| zeile +spalte +1}}
pp_mat(orig3)
#1.000000 2.000000 3.000000 4.000000 5.000000 
#2.000000 3.000000 4.000000 5.000000 6.000000 
#3.000000 4.000000 5.000000 6.000000 7.000000 
#4.000000 5.000000 6.000000 7.000000 8.000000 
#5.000000 6.000000 7.000000 8.000000 9.000000 
#6.000000 7.000000 8.000000 9.000000 10.000000 
#7.000000 8.000000 9.000000 10.000000 11.000000
pp_mat(gewichtet(orig3))
#5.000000 4.333333 5.333333 6.333333 5.666667 
#3.666667 3.000000 4.000000 5.000000 4.333333 
#4.666667 4.000000 5.000000 6.000000 5.333333 
#5.666667 5.000000 6.000000 7.000000 6.333333 
#6.666667 6.000000 7.000000 8.000000 7.333333 
#7.666667 7.000000 8.000000 9.000000 8.333333 
#6.333333 5.666667 6.666667 7.666667 7.000000 