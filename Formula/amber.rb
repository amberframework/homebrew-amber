class Amber < Formula
  desc "CLI client for generating, scaffolding Amber web applications"
  homepage "https://www.amberframework.org"
  url "https://github.com/amberframework/amber/archive/v0.5.0.tar.gz"
  sha256 "dfcf79a51a5ed6f1693cba0fc4761b4cd4cb7472f35df23182e68e4f4fa29e96"

  depends_on "crystal-lang"

  def install
    system "shards", "install"
    system "make", "install", "PREFIX=#{prefix}"
    bin.install "bin/amber"
  end

  test do
    assert_match "Amber CLI (amberframework.org) - v0.5.0", shell_output("#{bin}/amber -v")
  end
end
