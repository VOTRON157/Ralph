$bot.command :serverinfo, bucket: :command_delay, rate_limit_message: 'Espere `%time%` segundos para usar outro comando.' do |msg|
        guild = msg.server
        
        canais_texto = guild.channels.select {|item| 0 == item.type}.size
        canais_voz = guild.channels.select {|item| 2 == item.type}.size
        categorias = guild.channels.select {|item| 4 == item.type}.size
        
        levels = {
                "none" => "Nenhum",
                "low" => "Baixo",
                "medium" => "Médio",
                "high" => "Alto",
                "very_high" => "Muito alto"
        }
        level = levels["#{guild.verification_level}"]
        embed = Discordrb::Webhooks::Embed.new
        embed.color = "00FF00"
        embed.author = { name: "#{guild.name} | Informações", icon_url: "#{guild.icon_url}" }
        embed.thumbnail = { url: "#{guild.icon_url}" }
        embed.add_field(name: "[ 🆔 ] ID", value: "`#{guild.id}`")
        embed.add_field(name: "[ 👑 ] Dono(a) do servidor", value: "#{guild.owner.mention}  / `#{guild.owner.id}`")
        embed.add_field(name: "[ 👥 ] Membros", value: "`#{guild.member_count}`")
        embed.add_field(name: "[ <a:boost:818615946616766474> ] Nivel de boost", value: "`Level: #{guild.boost_level}`")
        embed.add_field(name: "[ <:shield:818912194736685138> ] Nivel de verificação", value: level)
        embed.add_field(name: "[ 📆 ] Criado em", value: "#{msg.server.creation_time.strftime("%d/%m/%Y")}")
        embed.add_field(name: "[ <:hastag:747904170752737411> ] Canais [#{guild.channels.size}]", value: "Texto: `#{canais_texto}`\nVoz: `#{canais_voz}`\nCategorias: `#{categorias}`")
        embed.footer = { text: "#{msg.user.name}##{msg.user.tag}", icon_url: "#{msg.user.avatar_url}" }
        embed.timestamp = Time.now
        $bot.reply(msg.message, { "embed" => embed.to_hash})
end