#!/bin/bash

# default installation directory is TEXMFLOCAL
TEXDIR=$(kpsewhich -var-value=TEXMFLOCAL)

# flags for user interaction and privileges
WAITFLAG=true
USERFLAG=false

# switches to change installation directory
for i in "$@"; do
  case $i in
    --user)
      TEXDIR=$(kpsewhich -var-value=TEXMFHOME)
      USERFLAG=true
      shift
      ;;
    --dir=*)
      TEXDIR="${i#*=}"
      shift
      ;;
    -y | --yes)
      WAITFLAG=false
      shift
      ;;
    *) ;; # unknown option
  esac
done

echo "The TUM LaTeX Templates will be installed to '$TEXDIR'."

while $WAITFLAG; do
  read -r -p "Continue installation? [y|n] " yn
  case $yn in
    [Yy]*) break ;;
    [Nn]*)
      echo "TUM LaTeX Templates installation aborted!"
      exit
      ;;
    *) ;;
  esac
done

# append tex/latex for proper TeX Directory Structure (TDS)
INSTALLDIR="$TEXDIR/tex/latex/"
# make directory if not present and copy files
mkdir -p "$INSTALLDIR"
if ! cp -r "tum" "$INSTALLDIR"; then
  echo "TUM LaTeX Templates installation failed!"
  exit
fi

# update texmf filename database (only for root installation)
if ! $USERFLAG; then
  mktexlsr
fi

echo "TUM LaTeX Templates successfully installed."
