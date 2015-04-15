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

      def to_numbers
        numbers = []
        @message.each_char do |char|
          if char != ' '
            numbers << Cipher::ALPHABET.index(char) + 1
          end
        end
        numbers
      end

  end
end
