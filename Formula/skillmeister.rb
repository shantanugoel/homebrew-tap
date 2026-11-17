class Skillmeister < Formula
  desc "Local library of agent skills with one router entry point"
  homepage "https://github.com/shantanugoel/skillmeister"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.2/skillmeister_0.2.2_darwin_arm64.tar.gz"
      sha256 "bc667cc17a353686103ea8d2308b3ec4ec14a32971ce2c18acf92ca7521de324"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.2/skillmeister_0.2.2_darwin_amd64.tar.gz"
      sha256 "0f79d2f9efaefdace0f1df9de0b54e558b03099f5b9fe84dbd0dd5d10e7533c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.2/skillmeister_0.2.2_linux_arm64.tar.gz"
      sha256 "a867127944b45057fd81635d4a7768320d9d422f60e642bcd4e167c032e929ed"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.2/skillmeister_0.2.2_linux_amd64.tar.gz"
      sha256 "8fb8a912248d3f4632d1baf6bf500b657103173337f0cb25fdbef24bbe8b6e3e"
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
    assert_match "skillmeister v0.2.2", shell_output("#{bin}/skillmeister --version")
  end
end
