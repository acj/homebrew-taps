class Hts < Formula
  desc "Highlight lines of program output based on the latency between them"
  homepage "https://github.com/acj/hts"
  url "https://github.com/acj/hts/archive/v0.2.0.tar.gz"
  sha256 "cc164837d0bbbb6925351116d5118d85598a9411a636e2a54ea74db212096e97"
  license "MIT"
  head "https://github.com/acj/hts.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
