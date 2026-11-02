cask "tovri" do
  version "0.4.0"
  sha256 "896d3352023e3549cf4bf8061fa7704ab8e9c472abe5121a7a6259c94b7f1d13"

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
