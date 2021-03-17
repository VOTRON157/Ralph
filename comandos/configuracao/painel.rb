$bot.command(:painel, bucket: :command_delay, rate_limit_message: 'Espere `%time%` segundos para usar outro comando.') do |msg|
  
  info = $mongo[:guilds].find(:server_id => msg.server.id).first 

  embed = Discordrb::Webhooks::Embed.new
  embed.color = "00FF00"
  embed.title = "#{$bot.profile.name} | Painel de configurações"
  embed.add_field(name: 'Canal de punições', value: info["ch_punicao"] != nil ? "<:ligado:737689845270577172> Ligado | Use: #{$bot.prefix}punição desligar" : "<:desligado:737689696939016260> Desligado | Use: #{$bot.prefix}punição #canal")
  embed.footer = { text: "#{msg.user.name}", icon_url: "#{msg.server.icon_url}?size=1024" }
  embed.timestamp = Time.now
  $bot.reply(msg.message, { "embed" => embed.to_hash })
end