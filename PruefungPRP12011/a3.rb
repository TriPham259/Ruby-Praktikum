class Object
  def abstract()
    raise AbstractMethodError
  end
  class AbstractMethodError < StandardError
  end
end

#  TODO Klassenmodell entwerfen

  # empfohlenes to_s für Angestellte
  def to_s()
    "A(#{@name})"
  end

  # empfohlenes to_s für Manager
  def to_s()
    "M(#@name,#{@mas.join(",")})" 
  end
