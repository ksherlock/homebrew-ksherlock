class Mdbasicxx < Formula
  desc "MDBASIC++"
  homepage "https://github.com/ksherlock/mdbasicxx"
  url "https://github.com/ksherlock/mdbasicxx.git",
    :tag => "0.0.1",
    :revision => "ccbd5f654c4dbaa6998ecf587540ec002c77df3b"
  version "0.0.1"
  sha256 ""

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
