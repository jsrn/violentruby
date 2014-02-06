#!/usr/bin/env ruby

class PortScanner
  def initialize
    puts "*" * 80
    puts "* port scanner"
    puts "* @jsrn"
    puts "*" * 80

    scan_host "127.0.0.1"
  end

  def scan_host(host)
  end
end

scanner = PortScanner.new