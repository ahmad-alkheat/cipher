require 'spec_helper'

describe Cipher::KeyStream do

  before(:each) do 
    @key = Cipher::KeyStream.new "CODEI NRUBY LIVEL ONGER"
  end

  context 'prepare the deck' do

    it 'moves the A joker one step up' do
      @key.deck = [ 1, 2, 3, 'B', 'A' ]
      expect(@key.send(:move_joker_A)).to eq([1,'A',2,3,'B'])
    end

    it 'moves the B joker two steps up' do
      @key.deck = [ 1, 2, 3, 'B', 'A' ]
      expect(@key.send(:move_joker_B)).to eq([ 1, 'B', 2, 3, 'A' ])
    end

    it 'performs a triple cut around the two jokers' do
      @key.deck = [2, 4, 6, 'B', 5, 8, 7, 1, 'A', 3, 9]
      expect(@key.send(:triple_cut)).to eq([3, 9, 'B', 5, 8, 7, 1, 'A', 2, 4, 6])
    end

    it 'performs a count cut' do
      @key.deck = ['A', 7, 2, 'B', 9, 4, 1]
      expect(@key.send(:count_cut)).to eq([7, 2, 'B', 9, 4, 'A', 1])
    end

    it "outputs the card value that has the top card's index" do
      @key.deck = [2,3,4,7,6]
      expect(@key.send(:find_output_card)).to eq(4) 
    end

    it 'outputs the next keystream for the message' do
      expect(@key.send(:convert_to_letter,4)).to eq("D") 
    end
  end

  context 'outputs a new message' do 

    it 'generates a keystream message for the original message' do
      expect(@key.key_stream_message).to eq('DWJXH YRFDG TMSHP UURXJ')
    end
      
  end

end