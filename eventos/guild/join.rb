$bot.server_create do |event|
  guild = event.server
  info = $mongo[:guilds].find({:server_id => guild.id}).first
  if !info 
    doc = { :_id => BSON::ObjectId.new, :server_id => guild.id }
    $mongo[:guilds].insert_one doc
  end 
end