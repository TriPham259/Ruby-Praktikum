require "tk"

class AnimationTimer
  
  def initialize()
    @step = 0
  end
  
  def next(faktor=3000,&b)
    TkRTTimer.new(0,1, proc{
     b.call()
    }).start(@step*faktor)
    @step+=1
  end

  def reset()
    @step = 0
  end
end
