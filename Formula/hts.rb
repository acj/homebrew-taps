class Hts < Formula
  desc "Highlight lines of program output based on the latency between them"
  homepage "https://github.com/acj/hts"
  url "https://github.com/acj/hts/archive/v0.2.0.tar.gz"
  sha256 "bd083470b14b6f0cd288cf9354756d20c78ff1e1f94a6b693e86ac89eac7f484"
  license "MIT"
  head "https://github.com/acj/hts.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end
