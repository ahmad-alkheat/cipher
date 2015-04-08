require "cipher/version"
require 'cipher/keystream'

module Cipher
  class Solitaire
    attr_accessor :message
    ALPHABET = ('A'..'Z').to_a

    def initialize message
      self.message = message
    end

    def strip
      self.message = message.gsub!(/\W+/, '')
    end

    def upcase_and_group_in_5
      self.message = message.upcase.scan(/...../).join(' ')
    end

    def to_numbers
      numbers = []
      self.message.each_char do |char|
        if char != ' '
          numbers << ALPHABET.index(char) + 1
        end
      end
      numbers
    end
  end
end
