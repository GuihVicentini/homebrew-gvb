class Dupliwise < Formula
  desc "List or organize duplicated files"
  homepage "https://github.com/GuihVicentini/dupliwise"
  url "https://github.com/GuihVicentini/dupliwise/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "fb7010bd6478c5ba70c600ec834a4f3b31cf6421a62e73c089728859462c0514"
  license "MIT"

  depends_on "rust" => :build

  conflicts_with "cli-utils", because: "cli-utils is a java implementation this same program"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "{bin}/dupliwise", "--help"
    assert_match "v0.1.0", shell_output("#{bin}/dupliwise --version")
  end
end
