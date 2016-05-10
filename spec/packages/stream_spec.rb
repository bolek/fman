describe Fman::Packages::Stream do
  let(:content) { "test\ntest2" }
  let(:stream) { StringIO.new(content) }

  subject { Fman::Packages::Stream.new(stream) }

  describe "#ship" do
    specify { expect { subject.ship }.to output(content << "\n").to_stdout }

    it "returns self" do
      allow(subject).to receive(:puts)

      expect(subject.ship).to eq(subject)
    end
  end
end
