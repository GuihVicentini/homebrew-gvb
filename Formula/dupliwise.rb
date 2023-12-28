class Dupliwise < Formula
  desc "List or organize duplicated files"
  homepage "https://github.com/GuihVicentini/dupliwise"
  url "https://github.com/GuihVicentini/dupliwise/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3fbede05f6b8af7ce10fe7b8a4dafef19750118978b13a7baf9781120bf00650"
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
