class Termbelt < Formula
  desc "Developer tool belt: network, domain and local utilities in one terminal"
  homepage "https://termbelt.rsapplication.com"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/rahatsagor/termbelt/releases/download/v1.1.1/termbelt_1.1.1_darwin_arm64.tar.gz"
      sha256 "94ce1ad7c92c513343df31b2395e1664aad9bacb0d70e3bb35bdea8b35b5c683"
    end
    on_intel do
      url "https://github.com/rahatsagor/termbelt/releases/download/v1.1.1/termbelt_1.1.1_darwin_amd64.tar.gz"
      sha256 "806067c0492eb42c4040698d7299578e74380933fdd422266ef4f99358784f22"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rahatsagor/termbelt/releases/download/v1.1.1/termbelt_1.1.1_linux_arm64.tar.gz"
      sha256 "5eb955cd9ebbca2195a60d84d36ee264ae4a840f45de97248204991eeea52d40"
    end
    on_intel do
      url "https://github.com/rahatsagor/termbelt/releases/download/v1.1.1/termbelt_1.1.1_linux_amd64.tar.gz"
      sha256 "17421dbbdd861f7a105fe1f722edb6aa92d16c481396f82f045bbd742bbfa8d6"
    end
  end

  def install
    bin.install "termbelt"
    prefix.install "THIRD_PARTY_NOTICES"
    generate_completions_from_executable(bin/"termbelt", "completion")
  end

  test do
    assert_equal "termbelt version #{version}", shell_output("#{bin}/termbelt --version").strip
    assert_match(/\A\h{8}-\h{4}-4\h{3}-[89ab]\h{3}-\h{12}\z/, shell_output("#{bin}/termbelt uuid --raw").strip)
    assert_equal "aGVsbG8=", pipe_output("#{bin}/termbelt base64 --raw", "hello").strip
  end
end
