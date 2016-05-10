describe Fman::Packages::String do
  let(:content) { "test\ntest" }
  subject { Fman::Packages::String.new(content) }

  describe "#ship" do
    specify { expect { subject.ship }.to output(content << "\n").to_stdout }

    it "returns self" do
      allow(subject).to receive(:puts)

      expect(subject.ship).to eq(subject)
    end
  end
end
