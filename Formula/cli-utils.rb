# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class CliUtils < Formula
  desc "Multiple useful command-line programs using Java"
  homepage "https://github.com/GuihVicentini/cli-utils"
  url "https://github.com/GuihVicentini/cli-utils/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "c09514ad342a1e960a102481288526a519bf08eba5657da962981d887249ba83"
  license "MIT"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6ae5b61c46ed1b72b0e4df1679d6f75a087075a0b25082f4f77f8f5f907dbfdc"
  end

  depends_on "gradle" => :build
  depends_on "openjdk@17"

  def install
    system "gradle", "clean", "build"
    libexec.install Dir["*"]
    bin.write_jar_script libexec/"quickgen/build/libs/quickgen-#{version}.jar", "quickgen"
    bin.write_jar_script libexec/"dupliwise/build/libs/dupliwise-#{version}.jar", "dupliwise"
  end

  test do
    system "#{bin}/quickgen", "--help"
    system "#{bin}/dupliwise", "--help"
  end
end
