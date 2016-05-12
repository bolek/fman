module Fman
  module Packages
    class Stream
      attr_reader :stream

      def initialize(stream)
        @stream = stream
      end

      def ship_to(destination)
        destination.receive do |p|
          stream.each { |line| p.call(line) }
        end
        stream.rewind
        self
      end
    end
  end
end
