module Cipher
  class KeyStream
    attr_accessor :message

    def initialize
      @deck = (1..52).to_a << "A", "B"
      #do stuff to get message = "DWJXH YRFDG TMSHP UURXJ"
    end

    def move_joker_A deck
      if deck.index('A') == deck.length - 1
        deck.insert(1, deck.delete_at(deck.index(deck.last)))
      else
        index = deck.index('A')
        deck[index], deck[index+1] = deck[index+1], deck[index]
      end
      deck
    end

  end
end