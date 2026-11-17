class Skillmeister < Formula
  desc "Local library of agent skills with one router entry point"
  homepage "https://github.com/shantanugoel/skillmeister"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.1/skillmeister_0.2.1_darwin_arm64.tar.gz"
      sha256 "c20bcacca39fa54032c0f2ed18c763f7d4624466d66da8a2f546c0967a87dd6b"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.1/skillmeister_0.2.1_darwin_amd64.tar.gz"
      sha256 "2eaa67614a580dee4804ee205bbccb1c3047be42e14a2be251468d285d160616"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.1/skillmeister_0.2.1_linux_arm64.tar.gz"
      sha256 "1bd28a0627d9ee0889a08d3e1ae758f30d057ee45612da672d230e9b5a211942"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.2.1/skillmeister_0.2.1_linux_amd64.tar.gz"
      sha256 "98025c5654efb2ccc3ad71cf50dac743fc6668d931c9fcd585b05482d18fc9bf"
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

      After an upgrade, run `skillmeister init` again if `skillmeister doctor`
      reports shim-stale.
    EOS
  end

  test do
    assert_match "skillmeister v0.2.1", shell_output("#{bin}/skillmeister --version")
  end
end
