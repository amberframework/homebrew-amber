class Amber < Formula
  desc "CLI client for generating, scaffolding Amber web applications"
  homepage "https://www.amberframework.org"
  url "https://github.com/amberframework/amber/archive/v0.5.0.tar.gz"
  sha256 "f1adcd9d954b011dd60251340ecfe67ee9ca06e2844fd8cb5b49bf2b6c86d852"

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
