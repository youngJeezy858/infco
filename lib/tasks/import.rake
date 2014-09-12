require 'json'

desc "Import json files from db/*.json"
task :import => [:environment] do

     File.open('db/automounts.json', 'r') do |file|
        file.each do |line|
	   attrs = JSON.parse line if line && line.length >= 2
	   Automount.create! attrs
	end
     end		          

     File.open('db/backups.json', 'r') do |file|
        file.each do |line|
	   attrs = JSON.parse line if line && line.length >= 2
	   BackupEntry.create! attrs
	end
     end		          

     File.open('db/labs.json', 'r') do |file|
        file.each do |line|
	   attrs = JSON.parse line if line && line.length >= 2
	   Lab.create! attrs
	end
     end		          

     File.open('db/ldap.json', 'r') do |file|
        file.each do |line|
	   attrs = JSON.parse line if line && line.length >= 2
	   LdapEntry.create! attrs
	end
     end		          

     File.open('db/load_balancers.json', 'r') do |file|
        file.each do |line|
	   attrs = JSON.parse line if line && line.length >= 2
	   LoadBalancer.create! attrs
	end
     end		          

     File.open('db/nagios.json', 'r') do |file|
        file.each do |line|
	   attrs = JSON.parse line if line && line.length >= 2
	   NagiosEntry.create! attrs
	end
     end		          

     File.open('db/relouds.json', 'r') do |file|
        file.each do |line|
	   attrs = JSON.parse line if line && line.length >= 2
	   ReloudEntry.create! attrs
	end
     end		          

     File.open('db/space.json', 'r') do |file|
        file.each do |line|
	   attrs = JSON.parse line if line && line.length >= 2
	   SpaceEntry.create! attrs
	end
     end		          

     File.open('db/printers.json', 'r') do |file|
        file.each do |line|
	   attrs = JSON.parse line if line && line.length >= 2
	   Printer.create! attrs
	end
     end		          

     File.open('db/machines.json', 'r') do |file|
        file.each do |line|
	   attrs = JSON.parse line if line && line.length >= 2
	   Machine.create! attrs
	end
     end		          

end
