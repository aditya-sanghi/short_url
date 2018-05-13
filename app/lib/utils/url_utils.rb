# frozen_string_literal: true

module Utils
  module UrlUtils
    CHARACTERS = 'aA0bB1cC2dD3eE4fF5gG6hH7iI8jJ9kKoOpPqQrRsStTuUvVwWxXyYzZ'
    BASE = CHARACTERS.size

    def self.encode(id_number)
      short_url_array = []
      while id_number.positive?
        short_url_array << CHARACTERS[id_number % BASE]
        id_number /= BASE
      end

      short_url_array.join('')
    end

    def self.decode(short_url_code)
      id_number = 0
      pow = 1
      short_url_code.split('').each do |char|
        id_number += CHARACTERS.index(char) * pow
        pow *= BASE
      end
      id_number
    end
  end
end
