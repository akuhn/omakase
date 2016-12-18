# Extends objects

class Object
  def itself
    self
  end

  def in?(enumerable)
    enumerable.include?(self)
  end
end
