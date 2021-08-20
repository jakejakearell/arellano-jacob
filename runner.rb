require_relative './lib/transform_list'

ARGV
old_list = File.open("./files/mixed_list.txt")
args = [ARGV[1], ARGV[2]]
transform = TransformList.new(old_list, args)

transform.new_output(ARGV[0])

puts "Created '#{ARGV[0]}' with sorted by #{ARGV[1]}  #{ARGV[2]}"
