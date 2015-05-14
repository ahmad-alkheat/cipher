require "cipher/version"
require 'cipher/keystream'

module Cipher
  ALPHABET = ('A'..'Z').to_a

  class Solitaire
    attr_accessor :message

    def initialize message
      @message = message
    end

    def encrypt 
      strip
      upcase_and_group_in_5
      stream_message = generate_stream_message
      original_numbers = to_numbers @message
      stream_numbers = to_numbers stream_message
      sum_numbers = add_numbers original_numbers, stream_numbers
      to_chars sum_numbers
    end

    private 

      def strip
        @message = @message.gsub!(/\W+/, '')
      end

      def upcase_and_group_in_5
        @message = @message.upcase + 'X' * ((5 - @message.size % 5 ) % 5 )  #second % for 0 length message
        @message.scan(/...../).join(' ')
      end

      def generate_stream_message
        @key = Cipher::KeyStream.new @message
        @key.key_stream_message
      end

      def to_numbers message
        numbers = []
        message.each_char do |char|
          if char != ' '
            numbers << Cipher::ALPHABET.index(char) + 1
          end
        end
        numbers
      end

      def add_numbers original, keystream
        sum = []
        (0..original.length-1).each do |i|
          tmp = original[i] + keystream[i] 
          sum << ( tmp <= 26? tmp : tmp - 26)
        end
        sum
      end

      def to_chars array
        chars = []
        array.each do |num|
          chars << Cipher::ALPHABET[num - 1]
        end
        @message = chars.join('').scan(/...../).join(' ')
      end

  end
end
