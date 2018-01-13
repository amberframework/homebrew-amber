class Amber < Formula
  desc "CLI client for generating, scaffolding Amber web applications"
  homepage "https://www.amberframework.org"
  url "https://github.com/amberframework/amber/archive/v0.6.3.tar.gz"
  sha256 "f65711e2fdc473bd77142acce8c383e591d87ab666f81f1008973b4b2aebf353"

  depends_on "crystal-lang"

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
      assert build_app, "Building: test_app"
    end
  end
end
