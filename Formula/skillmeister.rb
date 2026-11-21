class Skillmeister < Formula
  desc "Local library of agent skills with one router entry point"
  homepage "https://github.com/shantanugoel/skillmeister"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.4.1/skillmeister_0.4.1_darwin_arm64.tar.gz"
      sha256 "f37c2a17a8fd5a6e845083b3e1aac7b57d5a7053cac534a70f0a44bf495063dd"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.4.1/skillmeister_0.4.1_darwin_amd64.tar.gz"
      sha256 "457f2a136ab1da4f278ae6ffed00e8d3568c9f06e6159042a7bb6e7d4517fdc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.4.1/skillmeister_0.4.1_linux_arm64.tar.gz"
      sha256 "44532c8032e78bd94e4bc8e019ad2a4dc79fe8c0a33e4df0c6911c226613a40a"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.4.1/skillmeister_0.4.1_linux_amd64.tar.gz"
      sha256 "40351655c5edc74b46d2b0b343e955ef7854898eed3011c5ad77f9569646d309"
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
    assert_match "skillmeister v0.4.1", shell_output("#{bin}/skillmeister --version")
  end
end
