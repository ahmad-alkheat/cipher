require 'spec_helper'

describe Cipher do
  message = "Code in Ruby, live longer!"
  let (:solitaire) { Cipher::Solitaire.new message, "e"}
  context 'initialize' do
    it 'saves message' do
      expect(solitaire.message).to eq message
    end
  end



    it 'strips non-letter characters' do
      expect(solitaire.strip).to eq "CodeinRubylivelonger"
    end
end
