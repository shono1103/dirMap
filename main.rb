arguments = ARGV
root_path = ""
output_path = ""
if arguments.length == 2
    root_path = arguments[0]
    output_path = arguments[1]
elsif arguments.length == 0
    root_path = Dir.pwd
    output_path = Dir.pwd
else
    puts "形式が正しくありません"
    exit 1
end

puts "root = #{root_path} #{root_path.class}, output = #{output_path} #{output_path.class}"