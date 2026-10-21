class Fjord < Formula
  desc "Reference toolchain for the Fjord repository format."
  homepage "https://github.com/sovereignfs/fjord"
  version "0.3.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sovereignfs/fjord/releases/download/fjord-cli-v0.3.1/fjord-cli-aarch64-apple-darwin.tar.xz"
      sha256 "4b2da09d0cd1ba3ee67cbe072cfc2edec625367b74091a48a96fbfd8766ea995"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sovereignfs/fjord/releases/download/fjord-cli-v0.3.1/fjord-cli-x86_64-apple-darwin.tar.xz"
      sha256 "74e80e338e2bd1a5741ea3b1a8ae337406bcb2222eea950bf921be9da872029f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/sovereignfs/fjord/releases/download/fjord-cli-v0.3.1/fjord-cli-aarch64-unknown-linux-musl.tar.xz"
      sha256 "3408d7e04895c70d6064894794960fa05d0d2f94feaea0a818be1a97ae142f80"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sovereignfs/fjord/releases/download/fjord-cli-v0.3.1/fjord-cli-x86_64-unknown-linux-musl.tar.xz"
      sha256 "55aa750b8ca0cd0e2895b80c17decb507a746099c345a6684484fbf3c9d818b5"
    end
  end
  license "MPL-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
    "aarch64-unknown-linux-gnu":          {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static":  {},
    "x86_64-apple-darwin":                {},
    "x86_64-pc-windows-gnu":              {},
    "x86_64-unknown-linux-gnu":           {},
    "x86_64-unknown-linux-musl-dynamic":  {},
    "x86_64-unknown-linux-musl-static":   {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "fjord"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "fjord"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "fjord"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "fjord"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
