module Fman
  module Packages
    class String
      attr_reader :string

      def initialize(string)
        @string = string
      end

      def ship_to(destination)
        destination.receive do |p|
          p.call(string)
        end
        self
      end
    end
  end
end
