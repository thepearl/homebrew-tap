class XcodeJanitorMcp < Formula
  desc "MCP server for cleaning unused assets in Xcode projects"
  homepage "https://github.com/thepearl/xcode-janitor-mcp"
  url "https://github.com/thepearl/xcode-janitor-mcp.git",
      tag:      "v0.11.0",
      revision: "9c2669508d4fa68bac76dd2e2f114666c871e429"
  license "MIT"
  head "https://github.com/thepearl/xcode-janitor-mcp.git", branch: "main"

  depends_on :macos
  depends_on xcode: ["14.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/XcodeJanitorMCP" => "xcode-janitor-mcp"
  end

  test do
    # Test that the binary runs
    output = shell_output("#{bin}/xcode-janitor-mcp 2>&1", 0)
    assert_match "Starting Xcode Janitor MCP Server", output
  end
end
