module Cipher
  class KeyStream
    attr_accessor :deck
    attr_accessor :key_stream_message

    def initialize message
      @deck = (1..52).to_a + ['A', 'B']
      @key_stream_message = []
      generate message
    end


    private

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


      def move_joker(letter, step)
        new_position = (@deck.index(letter) + step) % @deck.length
        new_position = 1 if new_position.zero?
        @deck.insert(new_position,  @deck.delete(letter))
      end

      def is_joker card
        card == 'A' || card == 'B'
      end

      def move_joker_A
        move_joker 'A',1
      end

      def move_joker_B 
        move_joker 'B',2
      end

      def triple_cut
        first_joker_index = @deck.index { |x| is_joker x }
        second_joker_index = @deck.index { |x| (is_joker x) && x != @deck[first_joker_index] }
        first_part = @deck[0..first_joker_index-1]
        second_part = @deck[second_joker_index + 1.. @deck.length]
        @deck = @deck[first_joker_index..second_joker_index]
        @deck = second_part + @deck + first_part
      end

      def count_cut
        identifier = @deck.last
        return @deck if is_joker identifier || identifier == 0
        first_part = @deck[0..identifier-1]
        second_part = @deck[identifier..@deck.length-2]
        @deck = second_part + first_part + [identifier]
      end

      def find_output_card
        top = @deck.first
        top = 53 if is_joker top
        @deck[top]
      end

      def convert_to_letter index
        return nil if is_joker index
        index = index - 26 if index > 26
        Cipher::ALPHABET[index-1]
      end

  end
end
