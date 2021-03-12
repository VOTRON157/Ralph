require "discordrb"
require 'find'
require "httparty"
require "./db.rb"
load "./global_vars.rb"


$bot = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], client_id: "818216244029030441", prefix: '#'


$bot.mention do |event|
        event.channel.send_embed do |embed|
                embed.description = "Olá #{event.user.mention}, meu prefixo e `#`, use `#help` para ver meus comandos."
                embed.color = "WHITE"
        end
end
# EVENTO READY
$bot.ready do |event|
       $bot.game=('#help ou #ajuda')
        puts "BOT LIGADO 🏳️"
end
# ISSO E PARA CARREGAR AS PASTAS DOS COMANDOS!
Find.find('./comandos').collect do |e|
        if e != "./comandos" 
                puts "Comando #{e.split('/', -1)[2].split('.', -1)[0]} carregado"
                require e
        end
end 

def $bot.reply(message, options)
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

# require "./server.rb"



$bot.run