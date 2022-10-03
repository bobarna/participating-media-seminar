#!/bin/bash

# default installation directory is TEXMFLOCAL
TEXDIR=$(kpsewhich -var-value=TEXMFLOCAL)

echo "The TUM LaTeX Templates will be installed to '$TEXDIR'."

# append tex/latex for proper TeX Directory Structure (TDS)
INSTALLDIR="$TEXDIR/tex/latex/"
# make directory if not present and copy files
mkdir -p "$INSTALLDIR"
if ! cp -r "tum" "$INSTALLDIR"; then
  echo "TUM LaTeX Templates installation failed!"
  exit
fi

echo "TUM LaTeX Templates successfully installed."
