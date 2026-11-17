class Skillmeister < Formula
  desc "Local library of agent skills with one router entry point"
  homepage "https://github.com/shantanugoel/skillmeister"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.0/skillmeister_0.2.0_darwin_arm64.tar.gz"
      sha256 "0226b404e4b893e2dac9d9255af98d988fe170eda1c7fa92aee66bfa3ee2a7d9"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.0/skillmeister_0.2.0_darwin_amd64.tar.gz"
      sha256 "414bb24f6e2953821b8249967e68a7f04abef75dd0e37c7db18576a376244b7e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.0/skillmeister_0.2.0_linux_arm64.tar.gz"
      sha256 "58d5bb79e048fac44c307774d988d33efab73eb495dedf64f9960d785d88863b"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.0/skillmeister_0.2.0_linux_amd64.tar.gz"
      sha256 "dc8a3d7e73b46c843bf4b5964351732652567c92ff40203b3e21182b1f356779"
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

      It creates the library at ~/.skillmeister, writes the skillmeister skill
      for Claude Code and OpenCode, and adds one line to their memory files.
      It is safe to run again. Use `skillmeister --library PATH init` to put
      the library somewhere else.
    EOS
  end

  test do
    assert_match "skillmeister v0.2.0", shell_output("#{bin}/skillmeister --version")
  end
end
