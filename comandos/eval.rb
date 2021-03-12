
$bot.command :eval do |msg, *code|
        if msg.user.id != 712113218360967218 # meu id
                return "Apenas meu criador pode utilizar esse comando."
        end 
        if code.length == 0
                return "Insira um código para ser executado no eval"
        end
        begin 
        result = eval code.join(" ")
        if result.to_s.include?("#{$bot.token}") 
                 result = "token? aqui n"
        end
                msg.channel.send_embed do |embed|
                        embed.color = "WHITE"
                        embed.add_field(name: "**Resultado:**", value: "```rb\n#{result}\n```" )
                end
        rescue => e
               msg.respond("DEU ERRO MENÓ, FAZ O CÓDIGO DIREITO\n```rb\n#{e}\n```")
        end
end