require 'open-uri'
$bot.command :amongus, bucket: :command_delay, rate_limit_message: 'Espere `%time%` segundos para usar outro comando.' do |msg, *sus|
        base_url = "https://vacefron.nl/api/ejected?name=#{sus.join('+')}&impostor=true&crewmate=red"

        if sus.length == 0
                return $bot.reply(msg.message, { "content" => "Escreva o nome do impostor\n`Ex: #amongus Votron`" })
        end
        if sus.join(" ").length > 20
                return $bot.reply(msg.message, {"content" => "O limite e de 20 letras."})
        end 
        open("#{base_url}") do |image|
        File.open("./amongus.jpg", "wb") do |file|
          file.write(image.read)
        end 
      end
        msg.channel.send_file(File.open('amongus.jpg', 'r'), spoiler: true, caption: "🤔 | Quem será o impostor?\n||Executado por: #{msg.author.mention} 🤐||")
        File.delete("./amongus.jpg")
        return
end