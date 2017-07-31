class Amber < Formula
  desc "Amber CLI client for generating, scaffolding Amber web apps."
  version "0.1.20"
  homepage "https://www.ambercr.io"
  url "https://github.com/Amber-Crystal/amber-cmd/archive/v#{version}.tar.gz"
  sha256 "45ded959182ef17ac7a106bd653f6570a2d194f6d0900a1b16273c302caca33e"

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
