class Mdbasicxx < Formula
  desc "MDBASIC++"
  homepage "https://github.com/ksherlock/mdbasicxx"
  head "https://github.com/ksherlock/mdbasicxx.git"
  url "https://github.com/ksherlock/mdbasicxx/archive/0.0.7.tar.gz"
  sha256 "eecb920d178837c8ab91a6e9297b2b239f321e727a7d4c75e795266ea9314395"

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
