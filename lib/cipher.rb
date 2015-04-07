require "cipher/version"

module Cipher
  class Solitaire
    attr_accessor :message

    def initialize message, task
      self.message = message
    end

    def strip
      self.message = message.gsub!(/\W/, '')
    end
  end
end
