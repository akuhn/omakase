require 'spec_helper'

describe Omakase do

  it 'has a version number' do
    expect(Omakase::VERSION).not_to be nil
  end

  describe 'Enumerable#freq' do

    it 'should count element frequency' do
      array = %w{c b a c b a c c c d}
      freq = array.freq

      expect(freq['a']).to eq 2
      expect(freq['b']).to eq 2
      expect(freq['c']).to eq 5
      expect(freq['d']).to eq 1
    end

    it 'should handle nil elements' do
      array = [nil, nil, nil]
      freq = array.freq

      expect(freq[nil]).to be 3
    end

    it 'should be sorted by frequency' do
      array = %w{c b a c b a c c c d}

      expect(array.freq.keys).to eq %w{c b a d}
    end

  end
end
