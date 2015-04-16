require "cipher/version"
require 'cipher/keystream'

module Cipher
  ALPHABET = ('A'..'Z').to_a

  class Solitaire
    attr_accessor :message

    def initialize message
      @message = message
    end


    private 
      def strip
        @message = @message.gsub!(/\W+/, '')
      end

      def upcase_and_group_in_5
        @message = @message.upcase.scan(/...../).join(' ')
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

      def add_numbers
        original = to_numbers @message
        keystream = to_numbers @key.key_stream_message
        sum = []
        (0..original.length-1).each do |i|
          sum << original[i] + keystream[i]
        end
        sum
      end
  end
end
