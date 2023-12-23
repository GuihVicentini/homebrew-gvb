# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class CliUtils < Formula
  desc "Multiple useful command line programs using Java, GraalVM, Gradle and GitHubActions"
  homepage "https://github.com/GuihVicentini/cli-utils"
  url "https://github.com/GuihVicentini/cli-utils/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "c09514ad342a1e960a102481288526a519bf08eba5657da962981d887249ba83"
  license "MIT"

  # depends_on "graalvm/tap/graalvm-jdk17" => :build
  depends_on "gradle" => :build
  depends_on "openjdk@17"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6ae5b61c46ed1b72b0e4df1679d6f75a087075a0b25082f4f77f8f5f907dbfdc"
  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "gradle", "clean", "build"
    libexec.install Dir['*']
    bin.write_jar_script libexec/"quickgen/build/libs/quickgen-#{version}.jar", "quickgen"
    bin.write_jar_script libexec/"dupliwise/build/libs/dupliwise-#{version}.jar", "dupliwise"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test cli-utils`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/quickgen", "--help"
    system "#{bin}/dupliwise", "--help"
  end
end
