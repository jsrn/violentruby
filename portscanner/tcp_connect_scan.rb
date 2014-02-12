#!/usr/bin/env ruby
require "socket"
require "timeout"

class TCPConnectScan
  def initialize
    puts "*" * 80
    puts "* port scanner"
    puts "* @jsrn"
    puts "*" * 80

    @host  = ARGV[0]

    puts "[+] canning host #{@host}"
    (0..3000).each do |port|
      scan_host(@host, port)
    end
  end

  def scan_host(host, port)
    begin
      Timeout::timeout(4) do
        s = TCPSocket.new(host, port)
        print " #{port}/tcp "
        s.puts "SlothKrewScanner\n"
        resp = s.gets
        puts guess_type_from_port(port)
        s.close
      end
    rescue Timeout::Error
      puts "No response?!"
      guess_type_from_port(port)
    rescue
    end
  end

  def get_type_from_banner(banner)
    puts "Banner: " << banner
  end

  def guess_type_from_port(port)
    {
      80 => "http"
    }[port]
  end
end

scanner = TCPConnectScan.new