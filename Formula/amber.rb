class Amber < Formula
  desc "CLI client for generating, scaffolding Amber web applications"
  homepage "https://www.amberframework.org"
  url "https://github.com/amberframework/amber/archive/v0.5.0.tar.gz"
  sha256 "317e73aa00df21af419ec9e82649acc655506182031fce5585499f71f50db693"

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
