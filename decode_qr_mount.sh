#!/bin/bash

IFS=$'\n'

SOURCE="${1}"
TARGET="${2}"

read -s -p 'Wrapping passphrase: ' wrappingPassphrase
echo

zbarcam -q --raw -1 | base64 -d > /tmp/qr.decoded.bin

unwrappedPassphrase=$(printf "%s" "${wrappingPassphrase}" | ecryptfs-unwrap-passphrase /tmp/qr.decoded.bin -)

shred -u /tmp/qr.decoded.bin

echo -en '\n' \
	| sudo mount \
		-t ecryptfs \
		${SOURCE} \
		${TARGET} \
		-o key=passphrase:passphrase_passwd="${unwrappedPassphrase}",ecryptfs_cipher=aes,ecryptfs_key_bytes=16,ecryptfs_passthrough=no,ecryptfs_enable_filename_crypto=yes
