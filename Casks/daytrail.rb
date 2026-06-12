cask "daytrail" do
  version "0.1.24"
  sha256 "79dd59aa5516a2e62bda8fa0de87c7f78eb8ddf5803a30b686063d382d429b83"

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
