# Extends enumerables

module Enumerable

  def freq
    freq = Hash.new { |itself, key| itself[key] = 0 }
    each { |value| freq[value] += 1 }
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
