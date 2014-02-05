#!/usr/bin/env ruby

class Brutus
  def initialize
    puts "*" * 80
    puts "* unix style password brute forcer"
    puts "* @jsrn"
    puts "*" * 80


    File.open('hashes.txt').read.each_line do |line|
      line_parts = line.split(":")
     # puts line_parts
      user = line_parts[0]
      hash = line_parts[1]
      hash[0] = ""
      salt = hash[0..1]
      2.times { hash[0] = "" }
      puts "[+] cracking pass for user: #{user}"
      puts " -  hash: #{hash}"
      puts " -  salt: #{salt}"
      test_pass(salt, hash)
    end
  end

  def test_pass(salt, hash)
    File.open('dict.txt').read.each_line do |line|
      if line.crypt(salt) == "#{salt}#{hash}"
        puts " -  FOUND PASSWORD: #{line}"
        return
      end
    end
    puts " -  password not found"
  end
end

brutus = Brutus.new

#puts "egg".crypt("HX")
