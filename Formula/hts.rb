class Hts < Formula
  desc "Highlight lines of program output based on the latency between them"
  homepage "https://github.com/acj/hts"
  url "https://github.com/acj/hts/archive/v0.1.0.tar.gz"
  sha256 "0de6d99a69f7181f1f61cfdccd27e09cbe024fbdbbbba10706aa0b6e63059b4b"
  license "MIT"
  head "https://github.com/acj/hts.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
