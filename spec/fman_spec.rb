require "spec_helper"

describe Fman do
  it "has a version number" do
    expect(Fman::VERSION).not_to be nil
  end

  describe ".ship" do
    it "prints a StringIO object to stdout" do
      string_io = StringIO.new("some text\n more")
      expect { Fman.ship(string_io) }.to output("some text\n more\n").to_stdout
    end

  end
end
