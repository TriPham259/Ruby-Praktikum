class POI

  attr_reader :geo_coord, :attachments, :name

  protected :attachments
  def initialize(name, geo_coord)
    @name = name
    @geo_coord = geo_coord
    @attachments = []

  end

  def <<(attachment)
    # make sure parameter is Attachment
    return self unless attachment.is_a?(Attachment)
    # add attachment if not have yet
    @attachments << attachment unless @attachments.include?(attachment)

    self
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    @name == other.name && @geo_coord == other.geo_coord && @attachments == other.attachments
  end

  def hash
    @name.hash + @geo_coord.hash + @attachments.hash
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    @name.eql?(other.name) && @geo_coord.eql?(other.geo_coord) && @attachments.eql?(other.attachments)
  end

  def to_s
    "POI(#{@name},#{@geo_coord},\{#{@attachments.sort.join(',')}\}"
  end

end

class Geokoordinate
  attr_reader :bg, :lg

  def initialize(breitengrad,laengengrad)
    @bg = breitengrad
    @lg = laengengrad
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    @bg == other.bg && @lg == other.lg
  end

  def hash
    @bg.hash + @lg.hash
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    @bg.eql?(other.bg) && @lg.eql?(other.lg)
  end

  def to_s
    "(#{@bg},#{@lg})"
  end

end

class Attachment
  attr_reader :name,:inhalt

  def initialize(name,inhalt)
    @name = name
    @inhalt = inhalt
  end

  def ==(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    @name == other.name && @inhalt == other.inhalt
  end

  def hash
    @name.hash + @inhalt.hash
  end

  def eql?(other)
    return false if other.nil?
    return true if self.equal?(other)
    return false if self.class != other.class

    @name.eql?(other.name) && @inhalt.eql?(other.inhalt)
  end

  def to_s
    "At[#{@name},#{@inhalt}]"
  end

end

# my_geo = Geokoordinate.new(56.34, 23.89)
# your_geo = Geokoordinate.new(56.34, 23.89)
# attach1 = Attachment.new("CollosVideo","prp1://video:videocollos1")
# attach2 = Attachment.new("CollosVideo2","prp2://video:videocollos2")
# list_attach1 = [] << attach1 << attach2
# list_attach2 = [] << attach2 << attach1
# print list_attach1 == list_attach2

