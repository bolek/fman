require "fman/version"

module Fman
  def self.ship(package = StringIO.new(""))
    case package
    when StringIO
      package.each { |line| puts line }
    when String
      puts package
    end
  end
end
