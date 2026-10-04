class Askphysics < Formula
  desc "Answers physics questions with our own small language models and real math"
  homepage "https://github.com/shankar-sachin/ask-physics"
  url "https://github.com/shankar-sachin/ask-physics/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "81e4c58769bf5e81e487e5e1dd35ed8f04851d63bc2cf0e5874eeff6322ec040"
  license "MIT"
  head "https://github.com/shankar-sachin/ask-physics.git", branch: "main"

  depends_on "uv" => :build
  depends_on "python@3.12"

  def install
    # torch has no sane resource-block story, so let uv resolve the
    # dependencies into a private virtualenv under libexec.
    ENV["UV_CACHE_DIR"] = buildpath/".uv-cache"
    ENV["UV_PYTHON_DOWNLOADS"] = "never"
    python = formula_opt_bin("python@3.12")/"python3.12"
    system "uv", "venv", libexec, "--python", python
    # On Linux, pyproject.toml points uv at PyTorch's CPU-only wheels.
    system "uv", "pip", "install", "--python", libexec/"bin/python", buildpath
    bin.install_symlink libexec/"bin/askphysics"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/askphysics version")
    assert_match "all valid", shell_output("#{bin}/askphysics validate-data")
  end
end
