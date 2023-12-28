class Quickgen < Formula
  desc "Rust implementation of a uuid generator"
  homepage "https://github.com/GuihVicentini/quickgen"
  url "https://github.com/GuihVicentini/quickgen/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "b8eb57a0d523eaff2f6b3e011e3807cdd1b314829afdc0b222e54dfd8c13bb58"
  license "MIT"

  depends_on "rust" => :build

  conflicts_with "cli-utils", because: "cli-utils is a java implementation this same program"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "{bin}/quickgen", "--help"
    assert_match "v0.1.0", shell_output("#{bin}/quickgen --version")
  end
end
