describe Fman::Packages::Stream do
  let(:output) { "" }
  let(:receiving_proc) { proc { |x| output << x } }
  let(:destination) { double }
  let(:content) { "abc\ntest" }
  let(:stream) { StringIO.new(content) }

  subject { Fman::Packages::Stream.new(stream) }

  before { allow(destination).to receive(:receive).and_yield(receiving_proc) }

  describe "#ship_to" do
    it "calls the receiver proc for each line" do
      subject.ship_to(destination)

      expect(output).to eq("abc\ntest")
    end

    it "rewinds stream" do
      subject.ship_to(destination)

      expect(subject.stream.pos).to eq(0)
    end

    it "returns self" do
      expect(subject.ship_to(destination)).to eq(subject)
    end
  end
end
