class Cachalot < Formula
  desc "Local OS X Drupal Hosting based on Docker"
  homepage "https://github.com/AmazeeIO/cachalot"
  url "https://github.com/AmazeeIO/cachalot.git", :tag => "v0.9.3", :revision => "6e41bb25b2121f08d9a37b880fe21c24c27e886f"
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
