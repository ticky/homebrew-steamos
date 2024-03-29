class Linuxconsole < Formula
  desc "Set of utilities for joysticks and serial devices"
  homepage "https://sourceforge.net/projects/linuxconsole/"
  url "https://downloads.sourceforge.net/project/linuxconsole/linuxconsoletools-1.8.1.tar.bz2"
  sha256 "4da29745c782b7db18f5f37c49e77bf163121dd3761e2fc7636fa0cbf35c2456"
  license "GPL-1.0-or-later"

  bottle do
    root_url "https://github.com/ticky/homebrew-steamos/releases/download/linuxconsole-1.8.1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b5a546883d0feb58befc4ae886c7bc672840cb7d9ff9be2b45813cf5f65594d3"
  end

  depends_on :linux
  depends_on "sdl2"
  depends_on "systemd"

  def install
    system "make", "SYSTEMD_SUPPORT=1"
    cd "utils" do
      bin.install "jstest"
      bin.install "jscal"
      bin.install "jscal-restore"
      bin.install "jscal-store"
      bin.install "evdev-joystick"
      bin.install "inputattach"
      bin.install "fftest"
      bin.install "ffmvforce"
      bin.install "ffset"
      bin.install "ffcfstress"
    end
  end

  test do
    system "#{bin}/evdev-joystick", "--help"
  end
end
