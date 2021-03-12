require 'usagewatch_ext' # gem

usw = Usagewatch
$bot.command :botinfo do |msg|
        user = $bot.user(712113218360967218)
        embed = Discordrb::Webhooks::Embed.new
        embed.color = "WHITE"
        embed.description = "Olá **#{msg.user.username}** eu me chamo `#{$bot.profile.name}`, apenas mais um bot de discord entre varios outros!"
        embed.add_field(name: "**Estatísticas**", value: "> Servidores: `#{$bot.servers.size}`\n> Usuários: `#{$bot.users.size}`")
        embed.add_field(name: "**Informações**", value: "> Criador: `#{user.name}##{user.tag}`\n> Codigo fonte: [github](https://github.com/VOTRON157/Ralph)\n> Linguagem: `Ruby`\n> Gem: [discordrb](https://rubygems.org/gems/discordrb)")
        embed.add_field(name: "**Métricas**", value: "> Uso da CPU: `#{usw.uw_cpuused}%`\n> Ping: `#{Time.now - msg.timestamp}`")
        embed.footer = { text: "#{msg.user.name}##{msg.user.tag}", icon_url: "#{msg.user.avatar_url}" }
        embed.timestamp = Time.now
        $bot.reply(msg.message, { "embed" => embed.to_hash})
end