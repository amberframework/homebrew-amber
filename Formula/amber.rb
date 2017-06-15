class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  homepage "https://www.ambercr.io"
  url "https://github.com/Amber-Crystal/amber_cmd/archive/v0.1.15.tar.gz"
  sha256 "53cd5a3961658999523ab4045e30512585c61a3a2db0d0015f5414de7d2ffac2"

  depends_on "crystal-lang"
  depends_on "openssl"

  def install
    cd buildpath do
      system "shards", "install"
      system "crystal", "build", "-o", "amber", "src/amber_cmd.cr"
      bin.install "amber"
    end
  end

  test do
    system "#{bin}/amber", "--version"
  end
end
