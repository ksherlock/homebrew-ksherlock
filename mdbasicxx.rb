class Mdbasicxx < Formula
  desc "MDBASIC++"
  homepage "https://github.com/ksherlock/mdbasicxx"
  head "https://github.com/ksherlock/mdbasicxx.git"
  url "https://github.com/ksherlock/mdbasicxx/archive/0.0.2.tar.gz"
  sha256 "4c64ee0a39d4e3e26e311c119605c0217b7c13b638cc93a2a4c562b93f594c8b"

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
