$bot.command :amongus do |msg, *sus|
        base_url = "https://vacefron.nl/api/ejected?name=#{sus.join('+')}&impostor=true&crewmate=red"
        if sus.length == 0
                return "Escreva o nome do impostor\n`Ex: #amongus Votron`"
        end
        if sus.join(" ").length > 20
                return "O limite e de 20 letras."
        end 
        embed = Discordrb::Webhooks::Embed.new
        embed.color = "WHITE"
        embed.image = { url: "#{base_url}" }
        embed.timestamp = Time.now 
        embed.title = "<:impostor:819192961488257075>・Among us"
        embed.footer = { text: "#{msg.user.name}##{msg.user.tag}", icon_url: "#{msg.user.avatar_url}" }
        $bot.reply(msg.message, { "embed" => embed.to_hash })
end