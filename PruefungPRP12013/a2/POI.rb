class POI
  include Comparable
  attr_reader :geo_coord, :attachments, :name
  protected :attachments
  def initialize(name, geo_coord)
    @name = name
    @geo_coord = geo_coord
    @attachments = []
  end

  def <<(attachment)
    if !attachment.is_a?(Attachment)
      return self
    end
    if !(@attachments.include?(attachment))
      @attachments << attachment
    end
    return self
  end

  def to_s()
    return "POI(#@name,#@geo_coord,\{#{@attachments.sort().join(",")}\}"
  end

  # TODO
  def == other
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [geo_coord, attachments, name] == [geo_coord, attachments, name]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [geo_coord, attachments, name].eql?([geo_coord, attachments, name])
  end

  def hash
    geo_coord.hash + attachments.hash + name.hash
  end
  
  def <=> other 
    [name, geo_coord, attachments] <=> [other.name, other.geo_coord, other.attachments] 
  end  
end

class Geokoordinate
  include Comparable
  attr_reader :bg, :lg
  def initialize(breitengrad,laengengrad)
    @bg = breitengrad
    @lg = laengengrad
  end

  def to_s()
    return "(#@bg,#@lg)"
  end

  # TODO
  def == other
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [bg, lg] == [bg, lg]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [bg, lg].eql?([bg, lg])
  end

  def hash
    bg.hash + lg.hash
  end
  
def <=> other
  [bg, lg] <=> [other.bg, other.lg]
end
end

class Attachment
  include Comparable
  attr_reader :name,:inhalt
  def initialize(name,inhalt)
    @name = name
    @inhalt = inhalt
  end

  def to_s()
    "At[#@name,#@inhalt]"
  end

  # TODO
  def == other
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [name, inhalt] == [name, inhalt]
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class
    [name, inhalt].eql?([name, inhalt])
  end

  def hash
    name.hash + inhalt.hash
  end

  def <=> other
    [name, inhalt] <=> [other.name, other.inhalt]
  end
end

