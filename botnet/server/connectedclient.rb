class ConnectedClient
  attr_accessor :id

  def send_command(command)
    puts "Executing command: #{command}"
  end

  def print_status
    puts "  ID: #{@id}"
  end
end