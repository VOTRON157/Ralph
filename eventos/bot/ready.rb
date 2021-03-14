$bot.ready do |event| 
  $bot.servers.each do |guild| 
    guild = $bot.server(guild[0])
    if guild 
      info = $mongo[:guilds].find({:server_id => guild.id}).first 
      if !info 
        puts "Coloquei o servidor #{guild.name} na db"
        doc = { :_id => BSON::ObjectId.new, :server_id => guild.id }
        $mongo[:guilds].insert_one doc 
      end 
    end
  end 
  puts "[ BOT ] BOT INICIADO"
  $bot.game=('#help ou #ajuda')
end