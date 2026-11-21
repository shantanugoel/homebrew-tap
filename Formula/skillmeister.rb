class Skillmeister < Formula
  desc "Local library of agent skills with one router entry point"
  homepage "https://github.com/shantanugoel/skillmeister"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.5.0/skillmeister_0.5.0_darwin_arm64.tar.gz"
      sha256 "5e2c75887b99db33f51e266405d5a276758ded63ae50230ec505be1e7be2fbf9"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.5.0/skillmeister_0.5.0_darwin_amd64.tar.gz"
      sha256 "99ebba37ddbaca3466d3bd2fb42acc015b6f698a16ec085d7b41c578e0a28b89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.5.0/skillmeister_0.5.0_linux_arm64.tar.gz"
      sha256 "088a367bd2e594907a5d0db16c3f436c6d35c7febc12282f1f0308525e302d75"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.5.0/skillmeister_0.5.0_linux_amd64.tar.gz"
      sha256 "a4abffb29edcd9981ee334753cbac1e4bb7cb10354b5387193e43123e00e0384"
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
    assert_match "skillmeister v0.5.0", shell_output("#{bin}/skillmeister --version")
  end
end
