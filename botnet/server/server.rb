#!/usr/bin/env ruby
require_relative "connectedclient.rb"

class Server
  @clients = []

  def add_client
    puts "Adding client"
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