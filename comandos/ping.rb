$bot.command :ping do |msg|
        $bot.reply(msg.message, "Pong! meu ping e: #{Time.now - msg.timestamp}ms")
end