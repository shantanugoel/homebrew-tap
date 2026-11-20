class Skillmeister < Formula
  desc "Local library of agent skills with one router entry point"
  homepage "https://github.com/shantanugoel/skillmeister"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.4.0/skillmeister_0.4.0_darwin_arm64.tar.gz"
      sha256 "c64c4e03992df16467400cd95a39641e70f1ffc923dcec1f2fe6f345f6fa7ef8"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.4.0/skillmeister_0.4.0_darwin_amd64.tar.gz"
      sha256 "dac0d62d429fb0cd57e1bec71d5b7c00626da9a3b86c46d203f85e08e4e4de64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.4.0/skillmeister_0.4.0_linux_arm64.tar.gz"
      sha256 "9d993b099493095eced35921513cadd07cb82a728ec74fda3ab7198e7d13947e"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.4.0/skillmeister_0.4.0_linux_amd64.tar.gz"
      sha256 "f38cab1c4bd256584e673e3b86ed46aa711925943fc97c0318031bb16acce86a"
    end
  end

  def install
    bin.install "skillmeister"
    doc.install "README.md", "THIRD_PARTY_NOTICES.md"
  end

  def caveats
    <<~EOS
      Run this once to create your skill library and set up your agents:

        skillmeister init

      It creates the library at ~/.skillmeister and writes the skillmeister
      skill for Claude Code, OpenCode, and other agents that read ~/.agents.
      It is safe to run again. Use `skillmeister --library PATH init` to put
      the library somewhere else.

      After an upgrade, run `skillmeister init` again if `skillmeister doctor`
      reports shim-stale.
    EOS
  end

  test do
    assert_match "skillmeister v0.4.0", shell_output("#{bin}/skillmeister --version")
  end
end
