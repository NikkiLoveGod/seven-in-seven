# Write a simple grep that will print the lines of file that has any occurence of given phrase. You can include line numbers
# USAGE: ruby grep.rb <file> "<search string>"
file = ARGV[0]
text = ARGV[1]

f = File.open(file)
f.each { |line| puts "#{f.lineno}: #{line}" if /#{text}/i.match(line) }
