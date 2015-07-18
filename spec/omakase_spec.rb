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
      freq = 'bananas'.chars.freq
      expect(freq['a']).to eq 3
      expect(freq['b']).to eq 1
      expect(freq['n']).to eq 2
      expect(freq['s']).to eq 1
    end

    it 'should handle nil elements' do
      freq = [nil, nil, nil].freq
      expect(freq[nil]).to be 3
    end

    it 'should be sorted by frequency' do
      freq = 'bananas'.chars.freq
      expect(freq.keys).to eq %w(a n b s)
    end

  end

  describe 'Enumerable#index_by' do

    let(:names) do
      %w(coat mittens snowboard)
    end

    let(:objects) do
      struct = Struct.new(:name)
      names.map { |name| struct.new(name) }
    end

    it "should create a hash with keys" do
      index = objects.index_by(&:name)
      expect(index.keys).to match_array names
      expect(index.values).to match_array objects
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
