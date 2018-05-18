class Cachalot < Formula
  desc "Local OS X Drupal Hosting based on Docker"
  homepage "https://github.com/AmazeeIO/cachalot"
  url "https://github.com/AmazeeIO/cachalot.git", :tag => "v0.12.3", :revision => "a4a61289341a4f926ad847ec56a2477ea1f38d66"
  head "https://github.com/AmazeeIO/cachalot.git", :branch => :master

  depends_on "amazeeio/cachalot/unfs3"
  depends_on "dnsmasq"

  def install
    bin.install "bin/amazeeio-cachalot"
    bin.install "bin/_amazeeio-cachalot_command"
    bin.install "bin/cachalot"
    prefix.install "cli"
  end

  def caveats; <<~EOS
    Run `amazeeio-cachalot create` to create the VM, then `amazeeio-cachalot up` to bring up the VM and services.
    EOS
  end

  test do
    system "amazeeio-cachalot", "version"
  end
end
