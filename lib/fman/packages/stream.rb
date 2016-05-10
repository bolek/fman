module Fman
  module Packages
    class Stream
      attr_reader :stream

      def initialize(stream)
        @stream = stream
      end

      def ship
        stream.each { |line| puts line }
        stream.rewind
        self
      end
    end
  end
end
