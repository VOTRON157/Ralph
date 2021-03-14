require "discordrb"
require 'find'
require "httparty"
require "./db.rb"
load "./global_vars.rb"


$bot = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], client_id: "818216244029030441", prefix: '#'
$bot.bucket :command_delay, delay: 5
# ISSO E PARA CARREGAR AS PASTAS DOS COMANDOS!
Find.find('./comandos').collect do |e|
  if e.end_with?(".rb") 
    puts "[ COMANDO ] #{e.split('/')[3].split('.')[0]} carregado"
    require e
  end
end 

Find.find("./eventos").collect do |e| 
  if e.end_with?(".rb")
    puts "[ EVENTO ] #{e.split('/')[3].split('.')[0]} carregado"
    require e
  end
end

def $bot.reply(message, options) # inline reply
        body = {
                "content" => options["content"] || nil,
                "embed" => options["embed"] || nil,
                "message_reference" => {
                        "message_id" => message.id,
                        "channel_id" => message.channel.id,
                        "guild_id" => message.server.id
                }
        }
        headers = {
                "Content-Type" => "application/json",
                "Authorization" => "Bot #{ENV['TOKEN']}"
        }
        response = HTTParty.post("https://discord.com/api/v8/channels/#{message.channel.id}/messages", :headers => headers, :body => body.to_json)
        return
end

# require "./server.rb" # se vc usa repl.it ou glitch, isso e prá criar um servidor http para o bot não desligar.



$bot.run