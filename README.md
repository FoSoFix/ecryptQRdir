# ecryptQRdir
manages an additional private eCryptfs directory with a secret stored on a QR code
ecryptQRdir

It helps creating and mounting an additional eCryptfs directory (not the default ~/Private) by storing the secret "wrapped passphrase" on a QR code, that should be additionaly unwrapped by known "wrapping passphrase".
Of course it requires a webcam in order to scan the QR code and a printer to print it.

* required packages (Ubuntu)

  ecryptfs-utils
  zbar-tools
  qrencode
  
* generate QR code for this directory secret

  $ ./gen_qr.sh
  
  print it and store it in a secure place
  
* creates new private directory with QR + wrapping passphrase as secret

  $ ./first_qr_mount.sh <source_directory> <target_mountpoint>

  Asks for a QR created the step before to be shown, and the wrapping password, in order to decrypt the directory. Creates the whole new directory.
  
* mount private directory with QR + wrapping passphrase as secret

  $ ./decode_qr_mount.sh <source_directory> <target_mountpoint>

  Asks for a QR created the step before to be shown, and the wrapping password, in order to decrypt the directory

