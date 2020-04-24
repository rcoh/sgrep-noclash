#!/bin/bash
## For testing release jobs, make an empty ubuntu release quickly
set -e

mkdir -p semgrep-lint-files
echo "sgrep-core" > semgrep-lint-files/semgrep-core
echo "sgrep-lint" > semgrep-lint-files/semgrep
chmod +x semgrep-files/semgrep-core
chmod +x semgrep-files/semgrep
tar -cvzf artifacts.tar.gz semgrep-files/
