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
      url "https://github.com/rahatsagor/termbelt/releases/download/v1.2.0/termbelt_1.2.0_darwin_arm64.tar.gz"
      sha256 "aed6ea5929edb8824d2e29165d4c702e3a19c14cdc8cd16e3ebd26308e730eb4"
    end
    on_intel do
      url "https://github.com/rahatsagor/termbelt/releases/download/v1.2.0/termbelt_1.2.0_darwin_amd64.tar.gz"
      sha256 "98d2112736ae64b621309cd40c1dbf6a54e14635f07c7a4329445c51f7bfda18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rahatsagor/termbelt/releases/download/v1.2.0/termbelt_1.2.0_linux_arm64.tar.gz"
      sha256 "5b598eef8e193d8853880e2c3df07a2331a6100d5569248bc338e99d07db540c"
    end
    on_intel do
      url "https://github.com/rahatsagor/termbelt/releases/download/v1.2.0/termbelt_1.2.0_linux_amd64.tar.gz"
      sha256 "48fda1bce1ae68995d13312f7245ddb2fbf2cc6a61b71d452ffb9811312e9440"
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
