#!/bin/sh
set -e

THIS_DIR="$(dirname "$(realpath "$0")")";
cd "${THIS_DIR}"

# Pre-release of Nuitka that statically links binary https://github.com/Nuitka/Nuitka/issues/95
# If we use pre-release we get this error:
# ERROR: ld.so: object '/bin/sgrep-lint-files' from LD_PRELOAD cannot be preloaded (cannot open shared object file): ignored.
# ERROR: ld.so: object '/usr/local/bin/sgrep-lint-files' from LD_PRELOAD cannot be preloaded (cannot open shared object file): ignored.
# Traceback (most recent call last):
#   File "/home/pythonbuild/sgrep_lint/build/sgrep.dist/sgrep.py", line 2, in <module>
#   File "/home/pythonbuild/sgrep_lint/build/sgrep.dist/subprocess.py", line 152, in <module>
# ImportError: /home/pythonbuild/sgrep_lint/build/sgrep.dist/_posixsubprocess.so: undefined symbol: PyTuple_Type

# wget "http://nuitka.net/releases/Nuitka-0.6.8rc5.tar.gz"
# pip3 install Nuitka-0.6.8rc5.tar.gz


# If we use Nuitka 0.6.7 we get this error:
# /tmp/ccOBGSDq.ltrans20.ltrans.o: In function `Py_GetArgcArgv':
# <artificial>:(.text+0x790): multiple definition of `Py_GetArgcArgv'
# /usr/local/lib/libpython3.7m.a(main.o):/Python-3.7.7/Modules/main.c:3106: first defined here
# collect2: error: ld returned 1 exit status
# scons: *** [/home/pythonbuild/sgrep_lint/build/sgrep.dist/sgrep] Error 1

pip3 install Nuitka==0.6.7


pip3 install -r requirements.txt

echo "building and placing output binary in ${1}"
python3.7 -m nuitka --follow-imports --standalone --show-modules --recurse-to=colorama --output-dir="${1}" --warn-unusual-code --lto ./sgrep.py

# rename to sgrep-lint
mv "${1}/sgrep.dist/sgrep" "${1}/sgrep.dist/sgrep-lint-exe"
cp -v ./sgrep-lint "${1}/sgrep.dist/sgrep-lint"
