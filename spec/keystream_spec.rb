require 'spec_helper'

describe Cipher::KeyStream do
  message = "CODEI NRUBY LIVEL ONGER"
  let (:key) { Cipher::KeyStream.new }
  it 'generates a keystream letter for each letter in the original message' do 
    #expect(key.message).to eq "DWJXH YRFDG TMSHP UURXJ"
  end

  context 'prepare the deck' do 
    array = [1,2,3,'A']
    let (:keystream) { Cipher::KeyStream.new}
    it 'moves the "A" Djoker one step up' do 
      expect(keystream.move_joker_A(array)).to eq([1,'A',2,3])
    end
  end

end