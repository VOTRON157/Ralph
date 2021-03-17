$bot.command :ship do |msg| 
  user = msg.message.mentions
  if user.length != 2
    return $bot.reply(msg.message, {"content" => "Mencione 2 usuários diferentes"})
  end
  valores = [
    {
    "porcentagem" => rand(1..30),
    "mensagem" => "Acho que eles se odeiam..."
    },
    {
    "porcentagem" => rand(31..50),
    "mensagem" => "Se eles conversasem um pouco mais"
    },
    {
      "porcentagem" => rand(51..80),
      "mensagem" => "O amor está no ar"
    },
    {
      "porcentagem" => rand(81..100),
      "mensagem" => "Foram feitos um para o outro!"
    }]
   valor = valores[rand(0..valores.length - 1)]
   embed = Discordrb::Webhooks::Embed.new
   embed.color = "00FF00"
   embed.thumbnail = { url: "https://emoji.discord.st/emojis/MM707Heart.gif" }
   embed.description = "A chance de #{user.first.mention} e #{user.last.mention} darem certo e de **#{valor['porcentagem']}% ♥️**\n> #{valor['mensagem']}"
   embed.timestamp = Time.now
   $bot.reply(msg.message, {"embed" => embed.to_hash})
end