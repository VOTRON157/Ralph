require 'mongo'


Mongo::Logger.logger.level = ::Logger::FATAL

begin 
    $mongo = Mongo::Client.new("#{ENV['dbURL']}", :database => 'Ralph', :server_selection_timeout => 5)
    puts '[ BANCO ] CONECTADO COM SUCESSO AO BANCO DE DADOS'
rescue Mongo::Error::NoServerAvailable => e
    puts "[ BANCO ] NÃO FOI POSSIVEL LIGAR O BANCO DE DADOS\nError: #{e}"
  end