class Amber < Formula
  desc "Amber CLI tool for Amber web applications"
  homepage "https://www.amberframework.org/"
  url "https://github.com/amberframework/amber/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "37511d6b4afe308e1943cedeab9114b01d5787d868c23d2c0cc555917a21c830"
  license "MIT"

  depends_on "crystal"

  def install
    system "shards", "install"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    output = shell_output("#{bin}/amber new test_app")
    %w[
      config/environments
      amber.yml
      shard.yml
      public
      src/controllers
      src/views
      src/assets
      src/test_app.cr
    ].each do |path|
      assert_match path, output
    end

    cd "test_app" do
      build_app = shell_output("shards build test_app")
      assert_match "Building", build_app
      assert_predicate testpath/"test_app/bin/test_app", :exist?
    end
  end
end
