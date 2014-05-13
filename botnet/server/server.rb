#!/usr/bin/env ruby
require_relative "connectedclient.rb"

class Server
  def initialize
    @clients = []

    (1..10).each do |id|
      new_client    = ConnectedClient.new
      new_client.id = id

      add_client(new_client)
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