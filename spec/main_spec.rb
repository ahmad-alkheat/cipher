require 'spec_helper'

describe Cipher do
  message = "Code in Ruby, live longer!"
  let (:solitaire) { Cipher::Solitaire.new message, "e"}
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
end
