require './lib/enigma'

message_file = ARGV[0]
encrypt_file = ARGV[1]
key          = nil
date         = ARGV[3]

# Optional arguments
if ARGV[2] != nil
   key = ARGV[2] if ARGV[2].length == 5
   date = ARGV[2] if ARGV[2].length == 6
end

enigma = Enigma.new

encryption_data = enigma.encrypt(File.read(message_file), key, date)

File.write(encrypt_file, encryption_data[:encryption])
puts "Created #{encrypt_file} with the key #{encryption_data[:key]} and date #{encryption_data[:date]}"


