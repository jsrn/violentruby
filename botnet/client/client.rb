#!/usr/bin/env ruby
require "socket"

class Client
  def initialize
    @server_ip = "127.0.0.1"
    @server_port = 31337

    connect_to_server
  end

  def connect_to_server
    puts "Connecting to #{@server_ip} on port #{@server_port}"
    s = TCPSocket.open(@server_ip, @server_port)

    while line = s.gets   # Read lines from the socket
      puts line.chop      # And print with platform line terminator
    end
    s.close               # Close the socket when done
  end
end

Client.new