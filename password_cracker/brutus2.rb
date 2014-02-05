#!/usr/bin/env ruby

class Brutus
  def initialize
    puts "*" * 80
    puts "* unix style password brute forcer"
    puts "* @jsrn"
    puts "*" * 80


    File.open('hashes2.txt').read.each_line do |line|
      line_parts = line.split(":")
      user       = line_parts[0]
      hash       = line_parts[1]
      hash[0]    = ""
      type, salt, hash = hash.split("$")
      puts "[+] cracking pass for user: #{user}"
      puts " -  type: #{get_hash_type(type)}"
      puts " -  salt: #{salt}"
      puts " -  hash: #{hash}"
      test_pass(type, salt, hash)
    end
  end

  def get_hash_type(id)
    types = {
      "1"  => "MD5",
      "2a" => "Blowfish",
      "5"  => "SHA-256",
      "6"  => "SHA-512"
    }
    types[id]
  end

  def test_pass(type, salt, hash)
    case type
    when "1"
      brute_md5(salt, hash)
    when "2a"
      brute_blowfish(salt, hash)
    when "5"
      brute_sha256(salt, hash)
    when "6"
      brute_sha512(salt, hash)
    end
  end

  def brute_sha512(salt, hash)
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