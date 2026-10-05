cask "mooring" do
  version "0.1.0"
  sha256 "02dbebbba9fa8a38222beafbc837c57c8b35646a9905152354fcb74969b1c0da"

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
