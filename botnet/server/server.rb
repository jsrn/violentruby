#!/usr/bin/env ruby
require_relative "connectedclient.rb"

class Server
  @clients = []

  def add_client
  end

  def remove_client(index)
  end

  def list_clients
  end

  def command_all_clients(command)
    @clients.each do |client|
      command_client(client, command)
    end
  end

  def command_client(client, command)
  end
end