class Mdbasicxx < Formula
  desc "MDBASIC++"
  homepage "https://github.com/ksherlock/mdbasicxx"
  head "https://github.com/ksherlock/mdbasicxx.git"
  url "https://github.com/ksherlock/mdbasicxx/archive/0.0.3.tar.gz"
  sha256 "68e54cf26121f4f0f150d2b753a406f2bf246c5952dc7a8fdce20d6b29c5e881"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "mdbasic++.gemspec"
    system "gem", "install", "mdbasic++-#{version}.gem"
    bin.install libexec/"bin/mdbasic++"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    system "mdbasic++", "--help"
  end
end
