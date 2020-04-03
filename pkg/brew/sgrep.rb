# 1. Place this file inside of `pkg/brew` (name isn't important). The name of the file is the name of the 
#    formula
# 2. Create a symlink from the root directory named `HomebrewFormula` to `pkg/brew`
# 3. Replace all instances of YYYY
# 4. Install with:
#$ brew tap owner/repo https://github.com/owner/repo.git
#$ brew install name-of-formula
class SgrepBin < Formula
  version 'v0.4.9b5'
  desc "Like grep but for code"
  homepage "https://github.com/r2c/sgrep"

  if OS.mac?
      url "https://github.com/returntocorp/sgrep/suites/568031689/artifacts/3785056"
      sha256 "36291007fa5a691924fce3bc1622e13cb2564438"
  end

  def install
    # Name of the binary
    bin.install "sgrep-lint-exe"
  end
end
