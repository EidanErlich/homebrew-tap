cask "mooring" do
  version "0.1.1"
  sha256 "0a903e04b620d124fef6175309ca507430f16c5d1311b193d1149b1577e6cbfd"

  url "https://github.com/EidanErlich/mooring/releases/download/v#{version}/Mooring-#{version}.zip"
  name "Mooring"
  desc "Keep your Mac awake, arrange windows, and keep clipboard history"
  homepage "https://github.com/EidanErlich/mooring"

  auto_updates true
  depends_on macos: :sonoma

  app "Mooring.app"

  uninstall quit: "dev.mooring.app"

  zap trash: [
    "~/Library/Application Support/Mooring",
    "~/Library/Preferences/dev.mooring.app.plist",
    "~/Library/Preferences/dev.mooring.windows.plist",
    "~/Library/Preferences/dev.mooring.clipboard.plist",
  ]

  caveats <<~EOS
    Mooring is not notarized. If macOS blocks it on first open, go to
    System Settings > Privacy & Security > Open Anyway, or run:
      xattr -dr com.apple.quarantine /Applications/Mooring.app
  EOS
end
