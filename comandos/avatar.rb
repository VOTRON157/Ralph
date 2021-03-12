$bot.command :avatar, arg_types: [Discordrb::User] do |msg, user|
        id = msg.content.split(' ')[1]
        if !user 
               user = $bot.user(id ? id : msg.user.id)
       end 
       embed = Discordrb::Webhooks::Embed.new
       embed.color = "WHITE"
       embed.timestamp = Time.now 
       embed.title = "<:logo:737804753995694190>・Avatar de #{user.name}##{user.tag}"
       embed.image = { url: "#{user.avatar_url}?size=1024" }
       embed.footer = { text: "Executado por: #{msg.user.name}##{msg.user.tag}" }
       $bot.reply(msg.message, {"embed" => embed.to_hash})
end