require 'spec_helper'

describe Cipher::Solitaire do

  message = 'Code in Ruby, live longer!'
  let (:solitaire) { Cipher::Solitaire.new message}

  msg2 = 'CODEI NRUBY LIVEL ONGER'
  let (:obj) { Cipher::Solitaire.new msg2 }



  context 'initialize' do
    it 'saves message' do
      expect(solitaire.message).to eq message
    end
  end

  context 'sanatize message' do 
    it 'strips non-letter characters' do
      expect(solitaire.send(:strip)).to eq "CodeinRubylivelonger"
    end

    it 'upcases all letter and group them in groups of five' do 
      expect(solitaire.send(:upcase_and_group_in_5)).to eq 'CODEI NRUBY LIVEL ONGER'
    end
  end

  it 'generate a keystream letter for each letter in the message' do
    expect(obj.send(:generate_stream_message)).to eq 'DWJXH YRFDG TMSHP UURXJ'
  end

  context 'convert to numbers' do
    it 'converts each letter to its equivalent number' do
      numbers = [3, 15, 4, 5, 9, 14, 18, 21, 2, 25, 12, 9, 22, 5, 12, 15, 14, 7, 5, 18]
      expect(obj.send(:to_numbers,obj.message)).to eq numbers
    end

    it 'adds the numbers of the original message + the keystream message' do
      nums1 = [1,2,3]
      nums2 = [4,5,24]
      expect(obj.send(:add_numbers, nums1, nums2)).to eq [5,7,1]
    end
  end

  it 'converts numbers into equivalent letter' do 
    nums = [2,5,3,3,4]
    expect(obj.send(:to_chars, nums)).to eq "BECCD"
  end

  context 'it encrypts a full message. YEAH!' do
    it 'uses the encrypt method to piece together all the pieces' do
      s = Cipher::Solitaire.new 'Code in Ruby, live longer!'
      s.encrypt
      expect(s.message).to eq 'GLNCQ MJAFF FVOMB JIYCB'
    end
  end



end
