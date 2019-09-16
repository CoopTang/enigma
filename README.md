# Enigma

**Enigma** is an encryption and decryption tool based on Caesar's Cipher. It takes plain text files and outputs an encrypted file, which you can decrypt for if you use the same key and date used to encrypt the file.


## Installation

Run `bundle install` in order to install the required gems for **Enigma** and the tests

## Testing

To test all classes, navigate to the upper-most directory and run `rake` in your terminal. 

To test an individual class, run:
 `ruby test/<name of class>_test.rb`

## Encrypting a file

To encrypt a file, run the following command from the project directory:
`ruby lib/encrypt.rb <message to encrypt>.txt <output file>.txt`
This will output an encrypted file and tell you the key and date that was used to encrypt the file.

## Decrypting a file

In order to decrypt a file, you need the key and date that was used to encrypt the file. Then run the following command from the project directory:
`ruby lib/decrypt.rb <encrypted file>.txt <output file>.txt <key> <date>`
This will output a decrypted file.

