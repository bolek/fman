module Fman
  module Destinations
    class LocalFileSystem
      attr_reader :pathname

      def initialize(pathname)
        @pathname = pathname
      end

      def receive
        FileUtils.mkdir_p(dirname)
        f = File.open(pathname, "w")
        yield proc { |content| f.write(content) }
        f.close
        self
      end

      private

      def dirname
        File.dirname(pathname)
      end
    end
  end
end
