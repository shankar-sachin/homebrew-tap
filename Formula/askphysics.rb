class Askphysics < Formula
  desc "Answers physics questions with our own small language models and real math"
  homepage "https://github.com/shankar-sachin/ask-physics"
  url "https://github.com/shankar-sachin/ask-physics/archive/7f0f73cb1a42431f8235a5877b5ac9d2b6b8ec30.tar.gz"
  version "0.2.0"
  sha256 "25c381cc9104b6cb77731921388a2dbd0a49ee0ec586a9ece4c54b1e7f1f4675"
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
