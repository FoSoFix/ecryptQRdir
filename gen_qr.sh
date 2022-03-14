#!/bin/bash

wrappedPassphrase=$(cat /dev/urandom | tr -cd 'A-Z0-9' | dd bs=1 count=16 2>/dev/null)

read -s -p 'Wrapping passphrase: ' wrappingPassphrase
echo

printf "%s\n%s" "${wrappedPassphrase}" "${wrappingPassphrase}" | ecryptfs-wrap-passphrase /tmp/wrapped.txt -

qrencode "$(base64 /tmp/wrapped.txt)" -o qr.$(date +%s).png

shred -u /tmp/wrapped.txt
