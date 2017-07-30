class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version "0.1.19"
  homepage "https://www.ambercr.io"
  url "https://github.com/Amber-Crystal/amber-cmd/archive/v#{version}.tar.gz"
  sha256 "c5a921757c99207006a2213505557780005a3b15832b98e01d99f34fcdaadb06"

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
