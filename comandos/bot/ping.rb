$bot.command :ping, bucket: :command_delay, rate_limit_message: 'Espere `%time%` segundos para usar outro comando.' do |msg|
        $bot.reply(msg.message, { "content" => "Pong! meu ping e: #{Time.now - msg.timestamp}ms"})
end