class POI

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

end

class Geokoordinate
  attr_reader :bg, :lg
  def initialize(breitengrad,laengengrad)
    @bg = breitengrad
    @lg = laengengrad
  end

  def to_s()
    return "(#@bg,#@lg)"
  end

end

class Attachment
  attr_reader :name,:inhalt
  def initialize(name,inhalt)
    @name = name
    @inhalt = inhalt
  end

  def to_s()
    "At[#@name,#@inhalt]"
  end

end

