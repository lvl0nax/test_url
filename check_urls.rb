require 'rubygems'
require 'hpricot'
require 'nokogiri'
require 'socket'
require 'open-uri'

str = File.readlines("url2.txt")
str.delete_if {|s| s.to_i != 0}
t = Time.now + 2500
i = 0
url1 = 'http://www.teknikensvarld.se'
url2 = 'http://teknikensvarld-www-stage.bonnierdigitalservices.se'
File.open("log.txt", "w") do |io|
	while (t > Time.now) do
		str.each do |s|
			#url1 << s.strip.chomp
			url2 << s.split(";").first.strip.chomp
			puts url2
			#pg1 = Hpricot(open(url1)).search("//title").inner_text.strip
			pg2 = Hpricot(open(url2)).search("//title").inner_text.strip
			#if pg1 == pg2
			#	puts "ok"
			#else
			#	puts "FAILED -> #{s}"
			sss = s.split(";").last
				puts pg2 + "  :  " + s.split(";").last
				io.puts "#{url2}%#{pg2}%#{sss}"
			#end
			#i += 1
			puts "----------------------------#{i}"

			url1 = 'http://www.teknikensvarld.se'
			url2 = 'http://teknikensvarld-www-stage.bonnierdigitalservices.se'
		end
	end
end
