class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version "0.1.17"
  homepage "https://www.ambercr.io"
  url "https://github.com/Amber-Crystal/amber_cmd/archive/v#{version}.tar.gz"
  sha256 "721d8d9dbd13df2187e7d6ffad5b00894908dd18dbc90d65c85272422f84f4a5"

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
