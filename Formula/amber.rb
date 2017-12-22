class Amber < Formula
  desc "CLI client for generating, scaffolding Amber web applications"
  homepage "https://www.amberframework.org"
  url "https://github.com/amberframework/amber/archive/v0.3.7.tar.gz"
  sha256 "7ea92a6be65aaf715c9143311e2fc16937c1fa6d500dac1943c05f03ef1738b5"

  depends_on "crystal-lang"

  def install
    system "shards", "install"
    system "make", "install", "PREFIX=#{prefix}"
    bin.install "bin/amber"
  end

  test do
    assert_match "Amber CLI (amberframework.org) - v0.3.7", shell_output("#{bin}/amber -v")
  end
end
