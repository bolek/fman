module Fman
  module Packages
    class String
      attr_reader :string

      def initialize(string)
        @string = string
      end

      def ship
        puts string
        self
      end
    end
  end
end
