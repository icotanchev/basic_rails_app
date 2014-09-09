# encoding: UTF-8
require 'rails'
require 'rubyXL'

#class ClientImport
path = File.join(Rails.root, 'files', 'clients', 'clients_xls.xlsx')
workbook = RubyXL::Parser.parse(path)

workbook[0].extract_data.each do |client|
  Client.create!(company: client[1], id_number: client[2], owner: client[4], name: client[5])
end
#end
