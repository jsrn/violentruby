#!/usr/bin/env ruby
require 'socket'
require_relative "connectedclient.rb"

class Server
  def initialize
    @port = "31337"

    start_listener
    #@clients = []
#
    #(1..10).each do |id|
    #  new_client    = ConnectedClient.new
    #  new_client.id = id
#
    #  add_client(new_client)
    #end
  end

  def start_listener
    puts "[*] starting listener"
    server = TCPServer.open(@port)   # Socket to listen on port 2000
    loop do                         # Servers run forever
      Thread.start(server.accept) do |client|
        puts "[+] accepted client"
        client.puts(Time.now.ctime) # Send the time to the client
        client.puts "[-] closing the connection"
        client.close                # Disconnect from the client
      end
    end
  end

  def add_client(client)
    puts "[+] adding new client"
    client.print_status
    @clients << client
  end

  def remove_client(index)
    puts "Removing client #{index}"
  end

  def list_clients
    @clients.each do |client|
      client.print_status
    end
  end

  def command_all_clients(command)
    @clients.each do |client|
      command_client(client, command)
    end
  end

  def command_client(client, command)
    client.send_command(command)
  end
end

s = Server.new