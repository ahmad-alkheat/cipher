module Cipher
  class KeyStream
    attr_accessor :deck
    attr_accessor :key_stream_message

    def initialize message
      @deck = (1..52).to_a + ['A', 'B']
      @key_stream_message = []
      generate message
    end

    def move_joker_A
      if @deck.index('A') == @deck.length - 1
        @deck.insert(1, @deck.delete_at(@deck.index(@deck.last)))
      else
        index = @deck.index("A")
        @deck[index], @deck[index+1] = @deck[index+1], @deck[index]
      end
    end

    def move_joker_B 
      if @deck.index('B') == @deck.length - 1
        @deck.insert(2, @deck.delete_at(@deck.index(@deck.last)))
      elsif @deck.index('B') == @deck.length - 2
        @deck.insert(1, @deck.delete_at(@deck.index(deck[-2])))
      else
        index = @deck.index('B')
        @deck.insert(index + 2, @deck.delete_at(@deck.index(@deck[index])))
      end
    end

    def triple_cut
      first_joker_index = @deck.index { |x| x == 'A' || x == 'B' }
      second_joker_index = @deck.index { |x| (x == 'A' || x == 'B') && x != @deck[first_joker_index] }
      first_part = @deck[0..first_joker_index-1]
      second_part = @deck[second_joker_index + 1.. @deck.length]
      @deck = @deck[first_joker_index..second_joker_index]
      @deck = second_part + @deck + first_part
    end

    def count_cut
      identifier = @deck.last
      return @deck if identifier == 'A' || identifier == 'B' || identifier == 0
      first_part = @deck[0..identifier-1]
      second_part = @deck[identifier..@deck.length-2]
      @deck = second_part + first_part + [identifier]
    end

    def find_output_card
      top = @deck.first
      top = 53 if top == 'A' || top == 'B'
      @deck[top]
    end

    def convert_to_letter index
      return nil if index.instance_of? String
      index = index - 26 if index > 26
      Cipher::ALPHABET[index-1]
    end

    def generate message
      n = message.gsub(" ","").length
      while(@key_stream_message.length < n) 
        move_joker_A 
        move_joker_B
        triple_cut
        count_cut
        index = find_output_card
        c = convert_to_letter index
        @key_stream_message << c if c
      end
      @key_stream_message = @key_stream_message.join("").scan(/...../).join(" ")
    end

  end
end
