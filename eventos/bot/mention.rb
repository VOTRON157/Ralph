$bot.mention do |event|
  embed = Discordrb::Webhooks::Embed.new
  embed.description = "Prazer #{event.user.mention}, meu prefixo e `#`, use `#help` para ver meus comandos."
  embed.color = "00FF00"
  $bot.reply(event.message, { "embed" => embed.to_hash })
end