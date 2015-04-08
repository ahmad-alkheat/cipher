require "cipher/version"

module Cipher
  class Solitaire
    attr_accessor :message

    def initialize message, task
      self.message = message
    end

    def strip
      self.message = message.gsub!(/\W+/, '')
    end

    def upcase_and_group_in_5
      self.message = message.upcase.scan(/...../).join(' ')
    end
  end
end
