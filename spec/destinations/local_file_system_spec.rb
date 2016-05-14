require "fakefs/safe"

describe Fman::Destinations::LocalFileSystem do
  let(:pathname) { "tmp/path/file.txt" }
  subject { Fman::Destinations::LocalFileSystem.new(pathname) }

  it { expect(subject.pathname).to eq(pathname) }

  describe "#receive", fakefs: true do
    let(:content) { "some\ncontent\n" }

    it "outputs content to a file in local file system" do
      subject.receive { |p| p.call(content) }

      expect(File.read(pathname)).to eq(content)
    end

    it "returns self" do
      expect(subject.receive { |p| p.call(content) }).to eq(subject)
    end

    context "when path doesn't exist" do
      it "creates the required directory" do
        expect(File.directory?("tmp/path")).to eq(false)

        subject.receive { |p| p.call(content) }

        expect(File.directory?("tmp/path")).to eq(true)
      end
    end
  end
end
