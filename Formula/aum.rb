class Aum < Formula
  desc "Terminal monitor for AI coding-agent token usage"
  homepage "https://github.com/7samael7/agent-usage-monitor"
  url "https://github.com/7samael7/agent-usage-monitor/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9eaf032d4996a5477db0e8504b5d3e04c75e8e241dd6912508c89454d22d3f02"
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
