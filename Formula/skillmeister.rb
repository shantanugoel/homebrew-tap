class Skillmeister < Formula
  desc "Local library of agent skills with one router entry point"
  homepage "https://github.com/shantanugoel/skillmeister"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.3.1/skillmeister_0.3.1_darwin_arm64.tar.gz"
      sha256 "e5965b5980b307bd52d680deed792de6befbdf11be329a685dfebc94818701f0"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.3.1/skillmeister_0.3.1_darwin_amd64.tar.gz"
      sha256 "13c96aa32abe7293ffbe3a634ed7ca6e9ad5f5991564c4c4d47d8a86cc0b0a8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.3.1/skillmeister_0.3.1_linux_arm64.tar.gz"
      sha256 "304c0e757490c69bb87e0fc7dc4cbb85a55151b75b3322122002e9bba81b130a"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.3.1/skillmeister_0.3.1_linux_amd64.tar.gz"
      sha256 "2a05243a451fe736e6d7a8eeb4aa259b67b233e8d51050732cff7b95c51827dd"
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
    assert_match "skillmeister v0.3.1", shell_output("#{bin}/skillmeister --version")
  end
end
