require 'spec_helper'

describe Cipher::KeyStream do

  before(:each) do 
    @key = Cipher::KeyStream.new 
  end

  message = "CODEI NRUBY LIVEL ONGER"
  it 'generates a keystream letter for each letter in the original message' do 
    #expect(key.message).to eq "DWJXH YRFDG TMSHP UURXJ"
  end

  context 'prepare the deck' do 
    it 'moves the A joker one step up' do 
      array = [ 1, 2, 3, 'B', 'A' ]
      expect(@key.move_joker_A(array)).to eq([1,'A',2,3,'B'])
    end

    it 'moves the B joker two steps up' do 
      array = [ 1, 2, 3, 'B', 'A' ]
      expect(@key.move_joker_B(array)).to eq([ 1, 'B', 2, 3, 'A' ])
    end
  end

end