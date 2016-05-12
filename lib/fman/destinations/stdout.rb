module Fman
  module Destinations
    class Stdout
      def receive
        yield proc { |line| $stdout.write line }
      end
    end
  end
end
