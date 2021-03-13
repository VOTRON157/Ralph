#kick
$bot.command(:kick, arg_types: [Discordrb::User], required_permissions: [:kick_members], permission_message: "Você precisa ter a permissão `Expulsar Membros` para usar esse comando.", bucket: :command_delay, rate_limit_message: 'Espere `%time%` segundos para usar outro comando.') do |msg, user, *reason| 
        id = msg.content.split(" ")[1]
        if !msg.server.member($bot.profile.id).permission?(:kick_members)
                return "Eu preciso ter a permissão `Expulsar Membros` para executar esse comando."
        end 
        if !user 
                if id.to_s.length == 0
                        return 'Mencione um usuário para expulsar ou use o id' 
                end
                user = $bot.user(id)
                if !user 
                        return "Mencione um usuário para expulsar ou use o id"
                end
        end 
        if user.id == msg.user.id
                return msg.respond("Você não pode se expulsar.")
        end
        var = true
        begin
        msg.server.kick(user, reason = reason.join(" "))
        rescue 
        var = false
        msg.respond "Não consigo banir esse usuário."
end
        if !var 
                return 
        end
        msg.channel.send_embed do |embed|
                embed.color = "WHITE"
                embed.title = "Expulsão | #{msg.server.name}"
                embed.timestamp = Time.now
                embed.add_field(name: "**<a:staff:752867248401547315>・Punido**", value: "Username: #{user.name}##{user.tag}\nId: `#{user.id}`")
                embed.add_field(name: "**<:police:737487921124212737>・Staff**", value: "Username: #{msg.user.mention}\nId: `#{msg.user.id}`")
                embed.add_field(name: ":clipboard:・Punição", value: "Motivo: `#{reason.length != 0 ? reason.join(' ') : 'Não informado'}` \nData do ocorrido: #{Time.now}")
        end 
end