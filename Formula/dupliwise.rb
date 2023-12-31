class Dupliwise < Formula
  desc "List or organize duplicated files"
  homepage "https://github.com/GuihVicentini/dupliwise"
  url "https://github.com/GuihVicentini/dupliwise/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "7b3c05d03988caa404d8050b7b696441b215d100d98871984835d2fc71ecc1bf"
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
