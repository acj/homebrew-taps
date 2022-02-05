class Krapslog < Formula
  desc "Visualize logs in your terminal using sparklines"
  homepage "https://github.com/acj/krapslog-rs/"
  url "https://github.com/acj/krapslog-rs/archive/0.3.2.tar.gz"
  sha256 "762d1ba224491860ba1b6585652c51bf36ea6bada7e77c0a5dd8d07ef30a7e64"
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
