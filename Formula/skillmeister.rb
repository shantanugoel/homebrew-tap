class Skillmeister < Formula
  desc "Local library of agent skills with one router entry point"
  homepage "https://github.com/shantanugoel/skillmeister"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.3/skillmeister_0.2.3_darwin_arm64.tar.gz"
      sha256 "ca446df1bad67f2bd8b5c5e03f9f1a0819770688066dbff20b68cbe6ccb20682"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.3/skillmeister_0.2.3_darwin_amd64.tar.gz"
      sha256 "78743f9b937e0b6b6a8dd45160813bc3d5e99507d4ad58d482f402a3e68c8ac2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.3/skillmeister_0.2.3_linux_arm64.tar.gz"
      sha256 "272a035ed7f177cfdaf7cb7bf88cce425e07777e1b1e035c0e302cfb2727d670"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.3/skillmeister_0.2.3_linux_amd64.tar.gz"
      sha256 "d80a7eb7ef08d52cf8fee11ef03028081760d96d980e4b06ab0674b057f7a928"
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
    assert_match "skillmeister v0.2.3", shell_output("#{bin}/skillmeister --version")
  end
end
