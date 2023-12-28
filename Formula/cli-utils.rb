class CliUtils < Formula
  desc "Multiple useful command-line programs using Java"
  homepage "https://github.com/GuihVicentini/cli-utils"
  url "https://github.com/GuihVicentini/cli-utils/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "c09514ad342a1e960a102481288526a519bf08eba5657da962981d887249ba83"
  license "MIT"

  depends_on "gradle" => :build
  depends_on "openjdk@17"

  conflicts_with "quickgen", "dupliwise" because: "quickgen and dupliwise are a rust implementation of this program"

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
