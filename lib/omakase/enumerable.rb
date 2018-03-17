# Extends enumerables

module Enumerable

  def freq
    freq = Hash.new { |h, key| h[key] = 0 }
    if block_given?
      self.each { |value| freq[yield(value)] += 1 }
    else
      self.each { |value| freq[value] += 1 }
    end
    Hash[freq.sort_by { |key, count| -count }]
  end

  def index_by # { |each| }
    Hash[map { |value| [yield(value), value] }]
  end

  def where(options)
    raise ArgumentError unless Hash === options
    select { |each| options.all? { |key, pattern| pattern === each.send(key) }}
  end

end
