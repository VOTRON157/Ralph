$bot.command(:ban, arg_types: [Discordrb::User], required_permissions: [:ban_members], permission_message: "Você precisa ter a permissão `Banir Membros` para usar esse comando.", bucket: :command_delay, rate_limit_message: 'Espere `%time%` segundos para usar outro comando.' ) do |msg, user, *reason| 
        id = msg.content.split(" ")[1]
        if !msg.server.member($bot.profile.id).permission?(:ban_members)
                return $bot.reply(msg.message, {"content" => "Eu preciso ter a permissão `Banir Membros` para executar esse comando."})
        end 
        if !user 
                if id.to_s.length == 0
                        return $bot.reply(msg.message, {"content" => 'Mencione um usuário para banir ou use o id'})
                end
                user = $bot.user(id)
                if !user 
                        return $bot.reply(msg.message, {"content" => "Mencione um usuário para banir ou use o id"})
                end
        end 
        if user.id == msg.user.id
                return $bot.reply(msg.message, {"content" => "Você não pode se banir."})
        end 
        
        if msg.server.member(user.id) 
          @user = msg.server.member(user.id)
          if msg.user.highest_role.position <= @user.highest_role.position 
            return $bot.reply(msg.message, { "content" => "Esse usuário tem um cargo maior ou igual ao seu."})
          end 
        end
        var = true
        begin
        msg.server.ban(user, message_days = 7, reason: reason.join(" "))
        rescue
        var = false
        $bot.reply(msg.message, {"content" => "Não consigo banir esse usuário."}) 
end
        if !var 
                return 
        end 
        reason = reason.length != 0 ? reason.join(" ") : "Motivo não informado"
        info = $mongo[:guilds].find({:server_id => msg.server.id}).first 
        ch = msg.server.channels.select {|channel| info["ch_punicao"] == "#{channel.id}"}[0]
        if !ch 
          ch = msg.channel
        else 
          $bot.reply(msg.message, { "content" => "Usuário banido! (#{ch.mention})"})
        end
        ch.send_embed do |embed|
          embed.title = "Punição | Banimento"
          embed.color = "00FF00"
          embed.thumbnail = { url: "#{user.avatar_url}?size=1024" }
          embed.add_field(name: "**[ 👮 ] Moderador**", value: "> Tag: `#{msg.user.name}##{msg.user.tag}`\n> ID: `#{msg.user.id}`")
          embed.add_field(name: "**[ 👤 ] Punido**", value: "> Tag: `#{user.name}##{user.tag}`\n> ID: `#{user.id}`")
          embed.add_field(name: "**[ :clipboard: ] Motivo**", value: "> #{reason}")
          embed.footer = { text: "#{msg.server.name}", icon_url: "#{msg.server.icon_url}?size=1024" }
          embed.timestamp = Time.now
              end
end