# -*- coding: utf-8 -*-
require 'rubyXL'

print 'Creating Admin profile... '

User.where(email: 'h.tanchev@sito92.com').delete_all
User.create!(
  email: 'h.tanchev@sito92.com',
  first_name: 'Христо',
  last_name: 'Танчев',
  password: 'Test1234!!!!',
  role: 'admin')
puts 'done!'

print 'Creating Doctors profile... '
%w(Киро Венци Краси Румен).each do |person|
	User.create!(
							email: "#{person}@sito92.com",
						  first_name: person,
						  password: 'Test1234!!!!',
              role: 'doctor')
end
puts 'done!'

#class ClientImport
print 'Import Clients... '
path = File.join(Rails.root, 'files', 'clients', 'clients_xls.xlsx')
workbook = RubyXL::Parser.parse(path)

workbook[0].extract_data.each do |client|
  Client.create!(company: client[1], id_number: client[2], owner: client[4], name: client[5])
end

puts 'done!'
