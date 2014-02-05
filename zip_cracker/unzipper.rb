#!/usr/bin/env ruby

require 'archive/zip'

class Unzipper
  def initialize
    puts "*" * 80
    puts "* zip file brute forcer"
    puts "* @jsrn"
    puts "*" * 80

    @infile = ARGV[0]
    @dict   = ARGV[1]

    @infile ||= "secret.zip"
    @dict   ||= "../shared/dict.txt"

    crack
  end

  def crack
    puts "[+] beginning brute force of #{@infile}"
    File.open(@dict).read.each_line do |pass|
      pass.strip!
      begin
        Archive::Zip.extract( @infile, "out/", :password => pass )
        puts " -  PASSWORD FOUND: #{pass}"
        exit
      rescue
      end
    end
  end
end

unzipper = Unzipper.new