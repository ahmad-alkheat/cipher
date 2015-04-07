require 'spec_helper'

describe Cipher do
  context 'initialize' do
    message = "Code in Ruby, live longer!"
    let (:solitaire) { Cipher::Solitaire.new message, "e"}
    it 'strips non-letter characters' do
      expect(solitaire.strip).to eq "CodeinRubylivelonger"
    end
  end  
end
