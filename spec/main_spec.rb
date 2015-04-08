require 'spec_helper'

describe Cipher do
  message = "Code in Ruby, live longer!"
  let (:solitaire) { Cipher::Solitaire.new message}
  context 'initialize' do
    it 'saves message' do
      expect(solitaire.message).to eq message
    end
  end

  context 'sanatize message' do 
    it 'strips non-letter characters' do
      expect(solitaire.strip).to eq "CodeinRubylivelonger"
    end

    it 'upcases all letter and group them in groups of five' do 
      expect(solitaire.upcase_and_group_in_5).to eq "CODEI NRUBY LIVEL ONGER"
    end
  end

  context 'convert to numbers' do 
    it 'converts each letter to its equivalent number' do 
      local_message = "CODEI NRUBY LIVEL ONGER"
      obj = Cipher::Solitaire.new local_message
      numbers = [3, 15, 4, 5, 9, 14, 18, 21, 2, 25, 12, 9, 22, 5, 12, 15, 14, 7, 5, 18]
      expect(obj.to_numbers).to eq numbers
    end
  end
end
