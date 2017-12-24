class Amber < Formula
  desc "CLI client for generating, scaffolding Amber web applications"
  homepage "https://www.amberframework.org"
  url "https://github.com/amberframework/amber/archive/v0.5.0.tar.gz"
  sha256 "637873e7f7e5a28307dfb34adeba7120ab9df649cbd5f3f5a70d2cca059f587d"

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
