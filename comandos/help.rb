# help
$bot.command(:help, aliases: [:ajuda]) do |msg|
        embed = Discordrb::Webhooks::Embed.new
        embed.thumbnail = { url: "https://emoji.discord.st/emojis/DiscordLuv.gif" }
        embed.description = "Olá #{msg.user.mention}, esse são todos os meus comandos!"
        embed.color = "WHITE"
        embed.add_field(name: "[ <a:partner:818573808579510373> ] Bot", value: "`help` | `botinfo` | `ping` | `eval`")
        embed.add_field(name: "[ <a:descord:818938427378368552> ] Úteis", value: "`serverinfo` | `avatar`")
        embed.add_field(name: "[ <a:pipoca:737481639990525984> ] Entretenimento", value: "`amongus`")
        embed.timestamp = Time.now
        $bot.reply(msg.message, { "embed" => embed.to_hash })
end