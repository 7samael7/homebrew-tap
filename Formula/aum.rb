class Aum < Formula
  desc "Terminal monitor for AI coding-agent token usage"
  homepage "https://github.com/7samael7/agent-usage-monitor"
  url "https://github.com/7samael7/agent-usage-monitor/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d7e754ec4fc844fb51056fe23cdd4281900dc302339325bfdc438027d8105130"
  license "MIT"
  head "https://github.com/7samael7/agent-usage-monitor.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/aum-tui")
  end

  test do
    assert_match "aum #{version}", shell_output("#{bin}/aum --version") if build.stable?

    # With nothing to read, the report must still be a complete document:
    # a range, zero requests, and no cost invented for them.
    report = JSON.parse(shell_output("#{bin}/aum overview --json --no-sync"))
    assert_equal "all time", report["range"]
    assert_equal 0, report["totals"]["requests"]
    assert_nil report["cost"]["value"]
  end
end
