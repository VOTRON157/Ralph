$bot.command(:help, aliases: [:ajuda], bucket: :command_delay, rate_limit_message: 'Espere `%time%` segundos para usar outro comando.') do |msg|  
  def comandos(path) 
    @cmds = []
    Find.find("./comandos/#{path}").collect do |e| 
      if e.end_with?(".rb")
        @cmds.push("`#{e.split('/')[3].split('.')[0]}`")
      end 
    end 
    return @cmds.join(" | ")
  end 

        embed = Discordrb::Webhooks::Embed.new
        embed.thumbnail = { url: "https://emoji.discord.st/emojis/DiscordLuv.gif" }
        embed.author = { icon_url: "#{$bot.profile.avatar_url}", name: "#{$bot.profile.name} | Painel de comandos" }
        embed.description = "Olá #{msg.user.mention}, esse são todos os meus comandos!"
        embed.color = "00FF00"
        embed.add_field(name: "[ <a:partner:818573808579510373> ] Bot", value: "#{comandos('bot')}")
        embed.add_field(name: "[ <a:descord:818938427378368552> ] Úteis", value: "#{comandos('uteis')}")
        embed.add_field(name: "[ <a:pipoca:737481639990525984> ] Entretenimento", value: "#{comandos('entretenimento')}")
        embed.add_field(name: "[ <a:Sirene:752853626166312960> ] Moderação", value: "#{comandos('moderacao')}")
        embed.add_field(name: "[ <:a_:737484238172979252> ] Configuração", value: "#{comandos('configuracao')}")
        embed.footer = { text: "#{msg.user.username}##{msg.user.tag}", icon_url: "#{msg.user.avatar_url}" }
        embed.timestamp = Time.now
        $bot.reply(msg.message, { "embed" => embed.to_hash })
end