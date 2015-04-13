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

    it 'moves both jokers' do 
      array = ['A', 7, 2, 'B', 9, 4, 1]
      expect(@key.move_joker_B(@key.move_joker_A(array))).to eq([7, 'A', 2, 9, 4, 'B', 1])
    end


    it 'performs a triple cut around the two jokers' do 
      array = [2, 4, 6, 'B', 5, 8, 7, 1, 'A', 3, 9]
      expect(@key.triple_cut(array)).to eq([3, 9, 'B', 5, 8, 7, 1, 'A', 2, 4, 6])
    end
      
  end

end