
# Required libraries
require 'aws-sdk-s3'    # AWS S3 SDK
require 'pry'           # debugger (unused)
require 'securerandom'  # for random UUIDs
 
bucket_name = ENV['BUCKET_NAME']  # bucket name from env var
region = 'us-west-2'              # AWS region
 
client = Aws::S3::Client.new(region: region)  # Create a new instance of S3 client
 
resp = client.create_bucket(                        # create the bucket
  bucket: bucket_name,                       # bucket name
  create_bucket_configuration: {             # bucket settings
    location_constraint: region              # region to create it in
  }
)
# Pause the script
# type 'exit' to continue
# binding.pry
 
# Determine the number of files to create and upload
number_of_files = 1 + rand(6)                # random count, 1-6
puts "number_of_files: #{number_of_files}"   # print count
 
# Loop to create and upload each file
number_of_files.times do |i|                 # loop once per file
  puts "i: #{i}"                             # print index
  filename = "file_#{i}.txt"                 # file name / S3 key
  output_path = "/tmp/#{filename}"           # local path
 

# Write a unique id in each file
  File.open(output_path, 'w') do |f|         # open file for writing
    f.write(SecureRandom.uuid)               # write a random UUID
  end
 
  File.open(output_path, 'rb') do |f|        # open file for reading
    client.put_object(                       # upload (max 5GB)
      bucket: bucket_name,                   # target bucket
      key: filename,                         # object key
      body: f                                # file contents
    )
  end
end