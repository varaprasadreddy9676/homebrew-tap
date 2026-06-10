cask "daytrail" do
  version "0.1.18"
  sha256 "0e2ab80461f8cd5842f1f8ecd8a7ae6a4f53f2e0c23d20f2056cb839c097c56c"

  url "https://github.com/varaprasadreddy9676/DayTrail/releases/download/v#{version}/DayTrail_#{version}_aarch64.dmg"
  name "DayTrail"
  desc "Local-first work-memory desktop app"
  homepage "https://github.com/varaprasadreddy9676/DayTrail"

  app "DayTrail.app"

  # Strip Gatekeeper quarantine after every install/upgrade so the app opens
  # without the "damaged and can't be opened" warning on unsigned builds.
  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/DayTrail.app"]
  end

  zap trash: [
    "~/Library/Application Support/ai.daytrail.desktop",
    "~/Library/Logs/ai.daytrail.desktop",
  ]
end
