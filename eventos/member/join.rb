$bot.member_join do |event| 
  server = event.server
  user = event.user
  info = $mongo[:guilds].find({:server_id => server.id}).first
  canal = server.channels.select {|ch| info["ch_welcome"] == "#{ch.id}"}[0]
  if canal 
    canal.send_embed("#{user.mention}") do |embed| 
      embed.color = "00FF00"
      embed.title = "#{user.name}##{user.tag} | Bem vindo(a)!"
      embed.description = "Prazer #{user.mention}, Bem vindo(a) ao **#{server.name}** se divirta e siga as regras!"
      embed.footer = { text: "#{server.name}", icon_url: "#{server.icon_url}" }
      embed.timestamp = Time.now
      embed.thumbnail = { url: "#{user.avatar_url}" } 
    end 
  end
end