require './lib/enigma'

encrypt_file = ARGV[0]
decrypt_file = ARGV[1]
key          = ARGV[2]
date         = ARGV[3]
enigma       = Enigma.new

encryption_data = enigma.decrypt(File.read(encrypt_file), key, date)

File.write(decrypt_file, encryption_data[:decryption])
puts "Created #{decrypt_file} with the key #{encryption_data[:key]} and date #{encryption_data[:date]}"
