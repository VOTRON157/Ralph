require 'mongo'


Mongo::Logger.logger.level = ::Logger::FATAL

begin 
    $mongo = Mongo::Client.new("#{ENV['dbURL']}", :database => 'Ralph', :server_selection_timeout => 5)
    puts '[ BANCO ] CONECTADO COM SUCESSO AO BANCO DE DADOS'
rescue Mongo::Error::NoServerAvailable => e
    puts "[ BANCO ] NÃO FOI POSSIVEL LIGAR O BANCO DE DADOS\nError: #{e}"
end


# !!! VOU POR ISSO AQUI SÓ PRÁ NÃO ESQUECER !!!
#client[:users].find(:server_id => 837292997).each do |doc| #para buscar
        #puts doc["server_id"]
#end
#client[:users].insert_one doc #para inserur um documento
#client[:users].delete_one({:server_id => 837292997}) # para deletar um documento.