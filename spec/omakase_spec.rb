require 'spec_helper'

describe Omakase do

  it 'has a version number' do
    expect(Omakase::VERSION).not_to be nil
  end

  describe 'Array#without' do

    it 'should remove element' do
      array = %w(a bunny_lake b c)
      expect(array.without('bunny_lake')).to eq %w(a b c)
    end

    it 'should remove all occurences' do
      array = %w(a bunny_lake bunny_lake bunny_lake b c)
      expect(array.without('bunny_lake')).to eq %w(a b c)
    end

    it 'should use case equality' do
      array = %w(the quick brown fox jumps over the lazy dog)
      expect(array.without(/..../)).to eq %w(the fox the dog)
    end

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

  describe 'Hash#missing_method' do

    let(:hash) do
      { name: 'Peter', 'profession' => 'lion tamer', 'great love' => 'flannel' }
    end

    it "falls through if key is not found" do
      expect { hash.unknown_key }.to raise_error(NoMethodError)
    end

    it 'should provide method access for symbol keys' do
      expect { hash.name }.to_not raise_error
      expect(hash.name).to eq hash[:name]
    end

    it 'should provide method access for string keys' do
      expect { hash.profession }.to_not raise_error
      expect(hash.profession).to eq hash['profession']
    end

  end

end
