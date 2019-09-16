require './lib/enigma'

message_file = ARGV[0]
encrypt_file = ARGV[1]
key          = ARGV[2]
date         = ARGV[3]
enigma       = Enigma.new

encryption_data = enigma.encrypt(File.read(message_file), key, date)

File.write(encrypt_file, encryption_data[:encryption])
puts "Created #{encrypt_file} with the key #{encryption_data[:key]} and date #{encryption_data[:date]}"


