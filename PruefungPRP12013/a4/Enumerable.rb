module Enumerable
  
  def count(&b)
    if block_given?()
      ct = 0;
      self.each(){|x| 
        if b.call(x)
          ct +=1
        end
      }
      return ct
    else
      return self.size()
    end
  end
end