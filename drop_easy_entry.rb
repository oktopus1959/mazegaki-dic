#!/usr/bin/ruby -w

easyChars = {}

while line = gets
  line.gsub(/\s/, '').split('').each {|ch|
    easyChars[ch] = 1
  }
end

File.readlines("./ipadic.maze.txt").each do |line|
  if line =~ /BASE/
    puts line
    next
  end

  items = line.strip.split(/\t/)
  easy = true
  items[1].split('').each do |ch|
    if ch =~ /[一-龠々]/ && !easyChars[ch]
      easy = false
      break
    end
  end
  next if easy

  easyPatt = ''
  items[1].split('').each do |ch|
    if easyChars[ch]
      easyPatt = easyPatt + ch
    elsif easyPatt[-1] != "+"
      easyPatt = easyPatt + ".+"
    end
  end

#  STDERR.puts "easyPatt = #{easyPatt}"

  # 容易漢字をすべて含んでいる(つまりひらがなに開いていない)読みだけを出力する
  if items[0] =~ /^#{easyPatt}$/
    puts line
  end
end

