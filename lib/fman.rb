require "fman/version"

module Fman
  def self.ship(package = StringIO.new(""))
    package.each { |line| puts line }
  end
end
