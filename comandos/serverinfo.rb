
$bot.command :serverinfo do |msg|
        guild = msg.server
        
        canais_texto = guild.channels.select {|item| 0 == item.type}.size
        canais_voz = guild.channels.select {|item| 2 == item.type}.size
        categorias = guild.channels.select {|item| 4 == item.type}.size
        
        
        ano = "#{guild.creation_time}".split("-")[0] # como eu não sei nenhuma livraria que faz isso eu mesmo faço com minhas incríveis habilidades
        mes = "#{guild.creation_time}".split("-")[1]
        dia = "#{guild.creation_time}".split(" ")[0].split("-")[2]
        horas = "#{msg.server.creation_time}".split(" ")[1]
        def formatHours(hours) # as horas por padrão vem 3 horas adiantas, isso e so pra tirar essas 3 horas 
        hr_certa = "#{hours}".split(":")[0].to_i - 3
        return "#{hr_certa}:#{hours.split(':')[1]}:#{hours.split(':')[2]}"
end
        
        data = "28 de #{$meses[mes]} de #{ano} às #{formatHours(horas)}"
        levels = {
                "none" => "Nenhum",
                "low" => "Baixo",
                "medium" => "Médio",
                "high" => "Alto",
                "very_high" => "Muito alto"
        }
        level = levels["#{guild.verification_level}"]
        embed = Discordrb::Webhooks::Embed.new
        embed.color = "WHITE"
        embed.author = { name: "#{guild.name} | Informações⠀" }
        embed.thumbnail = { url: "#{guild.icon_url}" }
        embed.add_field(name: "🏷️ ・ID do servidor", value: "`#{guild.id}`")
        embed.add_field(name: "👑・Dono(a) do servidor", value: "#{guild.owner.mention}  / `#{guild.owner.id}`")
        embed.add_field(name: "👥・Membros", value: "`#{guild.member_count}`")
        embed.add_field(name: "<a:boost:818615946616766474>・Nivel de boost", value: "`Level: #{guild.boost_level}`")
        embed.add_field(name: "<:shield:818912194736685138>・Nivel de verificação", value: level)
        embed.add_field(name: "📆・Criado em", value: "#{data}")
        embed.add_field(name: "<:hastag:747904170752737411>・Canais [#{guild.channels.size}]", value: "Texto: `#{canais_texto}`\nVoz: `#{canais_voz}`\nCategorias: `#{categorias}`")
        embed.footer = { text: "#{msg.user.name}##{msg.user.tag}", icon_url: "#{msg.user.avatar_url}" }
        embed.timestamp = Time.now
        $bot.reply(msg.message, { "embed" => embed.to_hash})
end