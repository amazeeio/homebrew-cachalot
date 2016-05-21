class Cachalot < Formula
  desc "Local OS X Drupal Hosting based on Docker"
  homepage "https://github.com/AmazeeIO/cachalot"
  url "https://github.com/AmazeeIO/cachalot.git", :tag => "v0.11.0", :revision => "87c59c7710b2d97ac92f18c2642dbf8efb5750e7"
  head "https://github.com/AmazeeIO/cachalot.git", :branch => :master

  depends_on "unfs3"
  depends_on "dnsmasq"

  def install
    bin.install "bin/amazeeio-cachalot"
    bin.install "bin/_amazeeio-cachalot_command"
    prefix.install "cli"
  end

  def caveats; <<-EOS.undent
    Run `amazeeio-cachalot create` to create the VM, then `amazeeio-cachalot up` to bring up the VM and services.
    EOS
  end

  test do
    system "amazeeio-cachalot", "version"
  end
end
