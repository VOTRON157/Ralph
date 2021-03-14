$bot.server_delete do |event|
  guild = event.server
  info = $mongo[:guilds].find({:server_id => guild}).first
  if info
    $mongo[:guilds].delete_one({:server_id => guild})
  end
end