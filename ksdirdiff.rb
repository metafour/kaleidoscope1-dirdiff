#!/usr/bin/env ruby

if ARGV.length != 2
  puts "Incorrect # of arguments"
else
  if Dir.exists?(ARGV[0]) && Dir.exists?(ARGV[1])
    Dir.foreach(ARGV[0]) do |file|
      if File.file? "#{ARGV[0]}/#{file}"
        if File.exists? "#{ARGV[1]}/#{file}"
          system("ksdiff #{ARGV[0]}/#{file} #{ARGV[1]}/#{file}")
        else
          puts "#{ARGV[1]}/#{file} does not exist"
        end
      end
    end
  else
    puts "Both arguments are not directories"
  end
end
