class Skillmeister < Formula
  desc "Local library of agent skills with one router entry point"
  homepage "https://github.com/shantanugoel/skillmeister"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.1.0/skillmeister_0.1.0_darwin_arm64.tar.gz"
      sha256 "f63d34e5ee4327898dafb01491d911a20593dd74a76cf05ea11a0a39d2e05fef"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.1.0/skillmeister_0.1.0_darwin_amd64.tar.gz"
      sha256 "7e5d3bf25dc61ecda1b0b037d2248898f48586c02f3b348f125634f1c27355c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.1.0/skillmeister_0.1.0_linux_arm64.tar.gz"
      sha256 "aecbc483088bdacdf9afeaee29fb5c966f2c77d1a9f283758b5c5785a6b19584"
    end
    on_intel do
      url "https://github.com/shantanugoel/skillmeister/releases/download/v0.1.0/skillmeister_0.1.0_linux_amd64.tar.gz"
      sha256 "671386d0f45ff30fb1042803ce65c67d90356fe775eb28c301be1931fde73711"
    end
  end

  def install
    bin.install "skillmeister"
    doc.install "README.md", "THIRD_PARTY_NOTICES.md"
  end

  def caveats
    <<~EOS
      This installs the skillmeister binary. A library is a git repo with a
      skillmeister.yaml. To make one, clone the project and run its installer:

        git clone https://github.com/shantanugoel/skillmeister ~/dev/skillmeister
        ~/dev/skillmeister/scripts/install.sh

      The installer builds its own binary and renders the agent shim. Use the
      Homebrew binary with `skillmeister --library PATH` for other libraries.
    EOS
  end

  test do
    assert_match "skillmeister v0.1.0", shell_output("#{bin}/skillmeister --version")
  end
end
