describe Fman::Destinations::Stdout do
  subject { Fman::Destinations::Stdout.new }

  describe ".receive" do
    it "outputs received content to stdout" do
      expect { subject.receive { |p| p.call("sometext") } }.to output("sometext").to_stdout
    end
  end
end
