class Skillmeister < Formula
  desc "Local library of agent skills with one router entry point"
  homepage "https://github.com/shantanugoel/skillmeister"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.3.0/skillmeister_0.3.0_darwin_arm64.tar.gz"
      sha256 "1d74b4e421065c1581f16004402e48d7b9d3f521735e1d54e875fa5d31231ff3"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.3.0/skillmeister_0.3.0_darwin_amd64.tar.gz"
      sha256 "0f2f3ea87ad3db54c083ac3aab046fc5eeea8d6a162b7dc7e599649f4317efaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.3.0/skillmeister_0.3.0_linux_arm64.tar.gz"
      sha256 "b6c11903ef4a0d2d050688fde10637ddcccd4a9a2041e1045f6ca7f73b0d2766"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.3.0/skillmeister_0.3.0_linux_amd64.tar.gz"
      sha256 "01da969e70d6c1f16567f44253e7cf25e20a2427c0fbd634d09c085fefc23218"
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
    assert_match "skillmeister v0.3.0", shell_output("#{bin}/skillmeister --version")
  end
end
