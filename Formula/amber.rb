class Amber < Formula
  desc "CLI client for generating, scaffolding Amber web applications"
  homepage "https://www.amberframework.org"
  url "https://github.com/amberframework/amber/archive/v0.5.0.tar.gz"
  sha256 "acfe70cf674022021262a59042e0f04551434e3f3d8b61a3d5eefb39b89cc73d"

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
