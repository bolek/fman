describe Fman::Packages::String do
  let(:output) { "" }
  let(:content) { "test\ntest" }
  let(:receiving_proc) { proc { |x| output << x } }
  let(:destination) { double }

  subject { Fman::Packages::String.new(content) }

  before { allow(destination).to receive(:receive).and_yield(receiving_proc) }

  describe "#ship" do
    it "calls the receiver proc" do
      subject.ship_to(destination)

      expect(output).to eq("test\ntest")
    end

    it "returns self" do
      expect(subject.ship_to(destination)).to eq(subject)
    end
  end
end
