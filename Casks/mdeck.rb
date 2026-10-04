cask "mdeck" do
  version "1.0.0"
  # Filled in from the MDeck-<version>.zip.sha256 asset of the GitHub Release.
  sha256 "REPLACE_WITH_RELEASE_SHA256"

  url "https://github.com/allenv0/MDECK/releases/download/v#{version}/MDeck-#{version}.zip"
  name "MDeck"
  desc "Native music player with a retro MiniDisc aesthetic"
  homepage "https://github.com/allenv0/MDECK"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "MDECK.app"

  zap trash: [
    "~/Library/Containers/com.allenv0.MDeck",
    "~/Library/Containers/com.moerdowo.MDECK",
    "~/Library/Preferences/com.allenv0.MDeck.plist",
    "~/Library/Preferences/com.moerdowo.MDECK.plist",
    "~/Library/Saved Application State/com.allenv0.MDECK.savedState",
    "~/Library/Saved Application State/com.moerdowo.MDECK.savedState",
  ]

  caveats <<~EOS
    MDeck is ad-hoc signed, so Gatekeeper will block the first launch.
    Right-click MDeck.app in Finder and choose Open, or run:
      xattr -dr com.apple.quarantine /Applications/MDECK.app
    Alternatively, reinstall with quarantine disabled:
      brew reinstall --cask --no-quarantine mdeck
  EOS
end
