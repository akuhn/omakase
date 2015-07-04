# Extends enumerables

module Enumerable
  def freq
    freq = Hash.new { |itself, key| itself[key] = 0 }
    each { |value| freq[value] += 1 }
    Hash[freq.sort_by { |key, count| -count }]
  end
end
