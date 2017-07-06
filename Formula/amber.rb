class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version "0.1.17"
  homepage "https://www.ambercr.io"
  url "https://github.com/Amber-Crystal/amber_cmd/archive/v#{version}.tar.gz"
  sha256 "ce96509b7e34df86c7e1db3ed9cfe183c3c078b618d2945631d91ec7c2217251"

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
