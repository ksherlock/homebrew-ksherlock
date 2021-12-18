class Mdbasicxx < Formula
  desc "MDBASIC++"
  homepage "https://github.com/ksherlock/mdbasicxx"
  head "https://github.com/ksherlock/mdbasicxx.git"
  url "https://github.com/ksherlock/mdbasicxx/archive/0.0.6.tar.gz"
  sha256 "d2ff676e6d50ab31c1c069c1318d740e4926789e483156fdf73e4c6e1280b90a"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "mdbasic++.gemspec"
    system "gem", "install", "mdbasicxx-#{version}.gem"
    bin.install libexec/"bin/mdbasic++"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "mdbasic++", "--help"
  end
end
