class Krapslog < Formula
  desc "Visualize logs in your terminal using sparklines"
  homepage "https://github.com/acj/krapslog-rs/"
  url "https://github.com/acj/krapslog-rs/archive/0.1.3.tar.gz"
  sha256 "fb377cd6586dade97b676085cba0920d0016df6b2df2d3ed4c6438af9e9846a8"
  license "MIT"
  head "https://github.com/acj/krapslog-rs.git"

  bottle do
    root_url "https://github.com/acj/homebrew-krapslog-rs/releases/download/krapslog-0.1.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "8d62e37f0598cadc3db27682be3309b88524396f6882d799b2adf038cf9159f6"
    sha256 cellar: :any_skip_relocation, catalina:     "ed31c7462dc09dec3ed70f28614877afdabc289c87eb2743688bf896f79fab4c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5bafb2a5e509997666f51ec1df5eb398cf37d0d30f60c9a6f78b537372fecfc4"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    log_sample = <<~EOF
      Nov 23 06:26:40 ip-10-0-0-1 haproxy[20128]: 10.10.10.10:57305 [23/Nov/2019:06:26:40.781] public my-service/my-instance 0/0/0/78/78 206 913/458 - - ---- 9/9/6/0/0 0/0 {} {||1|bytes 0-0/499704} "GET /some-resource HTTP/1.1"
    EOF
    (testpath/"haproxy-sample.log").write(log_sample)
    system "#{bin}/krapslog", testpath/"haproxy-sample.log"
  end
end
