$bot.command :welcome, bucket: :command_delay, rate_limit_message: 'Espere `%time%` segundos para usar outro comando.', required_permissions: [:administrator], permission_message: "Você precisa ter a permissão `Administrador` para usar esse comando." do |msg, id|
  if id == 'desligar'
    $mongo[:guilds].update_one({:server_id => msg.server.id}, '$set' => {:ch_welcome => nil})
    @embed = Discordrb::Webhooks::Embed.new 
    @embed.color = "00FF00"
    @embed.thumbnail = { url: "#{msg.server.icon_url}" }
    @embed.title = "#{$bot.profile.name} | Sistema de welcome"
    @embed.footer = { text: "#{msg.user.name}", icon_url: "#{msg.user.avatar_url}" }
    @embed.timestamp = Time.now 
    @embed.description = "Não enviarei mais as mensagens de boas vindas no canal determinado."
    return $bot.reply(msg.message, {"embed" => @embed.to_hash})
  end
  if !id 
    @embed = Discordrb::Webhooks::Embed.new 
    @embed.color = "00FF00"
    @embed.description = "> **Oque você quer alterar?**"
    @embed.add_field(name: "Se quiser definir um canal", value: "Use `#welcome <menção do canal/id>`")
    @embed.add_field(name: "Se quiser remover o canal atual", value: "Use `#welcome desligar`")
    return $bot.reply(msg.message, { "embed" => @embed.to_hash})
  end
  if id.to_i == 0
    id = id[2..-2]
  end
  channel = msg.server.channels.select{|ch| id.to_i == ch.id}.first 
  if !channel 
    return $bot.reply(msg.message, { "content" => "Esse canal não existe ou eu não consigo ver."})
  end 
  $mongo[:guilds].update_one({:server_id => msg.server.id}, '$set' => {:ch_welcome => "#{channel.id}"})
  embed = Discordrb::Webhooks::Embed.new 
  embed.color = "00FF00"
  embed.thumbnail = { url: "#{msg.server.icon_url}" }
  embed.title = "#{$bot.profile.name} | Sistema de welcome"
  embed.footer = { text: "#{msg.user.name}", icon_url: "#{msg.user.avatar_url}" }
  embed.timestamp = Time.now 
  embed.description = "Eu enviarei as mensagens de boas vindas no canal #{channel.mention} a partir de agora."
  $bot.reply(msg.message, {"embed" => embed.to_hash})
end