# Extends arrays

class Array
  def without(pattern)
    self.reject { |each| pattern === each }
  end
end
