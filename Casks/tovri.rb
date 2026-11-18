cask "tovri" do
  version "0.6.2"
  sha256 "cec277d895487bc839125bf6f7ba9de0c42826c8b3dec95954bacda2bd43c185"

  url "https://github.com/rahatsagor/Tovri/releases/download/v#{version}/Tovri-#{version}.zip"
  name "Tovri"
  desc "Fast, lightweight native code and text editor"
  homepage "https://tovri.rsapplication.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Tovri.app"

  # Tovri is open source and not notarized by Apple. Removing the quarantine
  # flag lets it open without the "Apple could not verify" prompt.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Tovri.app"]
  end

  uninstall quit: "app.tovri.Tovri"

  zap trash: [
    "~/Library/Application Support/Tovri",
    "~/Library/Caches/app.tovri.Tovri",
    "~/Library/HTTPStorages/app.tovri.Tovri",
    "~/Library/Preferences/app.tovri.Tovri.plist",
    "~/Library/Saved Application State/app.tovri.Tovri.savedState",
    "~/Library/WebKit/app.tovri.Tovri",
  ]

  caveats <<~EOS
    To open files from Terminal with `tovri`, open Tovri and choose
    Tovri → Install "tovri" Command… in the menu bar.
  EOS
end
