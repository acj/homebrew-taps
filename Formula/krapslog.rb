class Krapslog < Formula
  desc "Visualize logs in your terminal using sparklines"
  homepage "https://github.com/acj/krapslog-rs/"
  url "https://github.com/acj/krapslog-rs/archive/0.1.2.tar.gz"
  sha256 "d9330720c30af2d7b72ef5f7f904861eb9d50b0a3360ba3f073c70ce9e657772"
  license "MIT"
  head "https://github.com/acj/krapslog-rs.git"

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
