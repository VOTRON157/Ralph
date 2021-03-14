$bot.command :punição, aliases: [:punicao], bucket: :command_delay, rate_limit_message: 'Espere `%time%` segundos para usar outro comando.' do |msg, id|
  if id == 'desligar'
    $mongo[:guilds].update_one({:server_id => msg.server.id}, '$set' => {:ch_punicao => nil})
    @embed = Discordrb::Webhooks::Embed.new 
    @embed.color = "00FF00"
    @embed.thumbnail = { url: "#{msg.server.icon_url}" }
    @embed.title = "#{$bot.profile.name} | Sistema de punições"
    @embed.footer = { text: "#{msg.user.name}", icon_url: "#{msg.user.avatar_url}" }
    @embed.timestamp = Time.now 
    @embed.description = "Não enviarei mais as punições no canal determinado."
    return $bot.reply(msg.message, {"embed" => @embed.to_hash})
  end
  if !id 
    return $bot.reply(msg.message, { "content" => "Uso correto: `#{$bot.prefix}punição <menção do canal/id>`\n Ou #{$bot.prefix}punição desligar `(para remover o canal atual)`"})
  end
  if id.to_i == 0
    id = id[2..-2]
  end
  channel = msg.server.channels.select{|ch| id.to_i == ch.id}.first 
  if !channel 
    return $bot.reply(msg.message, { "content" => "Esse canal não existe ou eu não consigo ver."})
  end 
  $mongo[:guilds].update_one({:server_id => msg.server.id}, '$set' => {:ch_punicao => "#{channel.id}"})
  embed = Discordrb::Webhooks::Embed.new 
  embed.color = "00FF00"
  embed.thumbnail = { url: "#{msg.server.icon_url}" }
  embed.title = "#{$bot.profile.name} | Sistema de punições"
  embed.footer = { text: "#{msg.user.name}", icon_url: "#{msg.user.avatar_url}" }
  embed.timestamp = Time.now 
  embed.description = "Eu enviarei as punições no canal #{channel.mention} a partir de agora."
  $bot.reply(msg.message, {"embed" => embed.to_hash})
end