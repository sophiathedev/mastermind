macro engine_response(message)
  puts {{ message }}
  STDOUT.flush
end

class UCI
  VERSION = {{ `shards version #{__DIR__}/..`.chomp.stringify }}

  def initialize

  end

  def run
    engine_response "Mastermind #{VERSION} by the Mastermind developers (see AUTHORS file)"

    while line = gets
      process_command(line.strip)
    end
  end

  private def process_command(line)
    return if line.empty?

    tokens = line.split(" ")
    cmd = tokens.first

    case cmd
    when "uci"
      engine_response "id name Mastermind #{VERSION}"
      engine_response "id author the Mastermind developers (see AUTHORS file)"
      engine_response "uciok"
    when "isready"
      engine_response "readyok"
    when "ucinewgame"
      # TODO: Reset the game state here
    when "quit"
      exit(0)
    end
  end
end
