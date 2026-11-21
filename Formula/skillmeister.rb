class Skillmeister < Formula
  desc "Local library of agent skills with one router entry point"
  homepage "https://github.com/shantanugoel/skillmeister"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.6.0/skillmeister_0.6.0_darwin_arm64.tar.gz"
      sha256 "25d52120cccede4888314395f4681cf02bbe0fff3d2281c0ed8647d301b50f01"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.6.0/skillmeister_0.6.0_darwin_amd64.tar.gz"
      sha256 "5c17eed7c40031c622f1bd8c977931833e079325ec585d2d4e6a126560d73c2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.6.0/skillmeister_0.6.0_linux_arm64.tar.gz"
      sha256 "36e129f48e389d0fa0ffcc7a4eade5791f6ff9a5f596f7175db3b30233401727"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.6.0/skillmeister_0.6.0_linux_amd64.tar.gz"
      sha256 "5db94dedba81dd3c72dd98f920a3b87859d2d792975cca6a374b174a67a2eedc"
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
    assert_match "skillmeister v0.6.0", shell_output("#{bin}/skillmeister --version")
  end
end
