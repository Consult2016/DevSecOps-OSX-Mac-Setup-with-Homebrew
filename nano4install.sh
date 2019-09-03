#!/usr/bin/env bash

# Install Nano (www.nano-editor.org) with syntax highlighting (MacOS)

VERSION="4.1"
NANO_SHORT="nano-$VERSION"
NANO_SRC="$NANO_SHORT.tar.gz"
NANO_URL="https://www.nano-editor.org/dist/v4"
NANO_EXTRA="https://github.com/scopatz/nanorc"

cd ~/
curl -Ok $NANO_URL/$NANO_SRC
tar -zxvf $NANO_SRC

mv $NANO_SHORT .nano && cd .nano/
./configure && make && sudo make install

git clone --depth=1 $NANO_EXTRA syntax_improved
cd ~/ && touch .nanorc

cat > .nanorc <<EOF
include ~/.nano/syntax/*.nanorc
include ~/.nano/syntax_improved/*.nanorc
EOF

rm -vf $NANO_SRC
printf "\nExit terminal and reopen to start using $NANO_SHORT\nTo uninstall it and revert to old:\ncd ~/.nano && sudo make clean uninstall && rm -rf ~/.nano\n"
exit
