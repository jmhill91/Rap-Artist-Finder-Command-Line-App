require_relative '../config/environment'

# https://www.youtube.com/results?search_query=nipsey+hussle
# https://www.youtube.com/results?search_query=nipsey+hussle+grindin+all+my+life

# def self.google_search(user)
#   prompt = TTY::Prompt.new
#   query = prompt.ask("What Ruby topic would you like to search?")
#   html = open("https://www.google.com/search?q=Ruby #{query}")
#   doc = Nokogiri::HTML(html)
#
#   link_and_description = doc.search(".g")
#
#   new_tip = Tip.create()
#
#   new_tip.name = link_and_description.first.search('h3').text
#   new_tip.content = link_and_description.first.search('.s').css('span').text
#   new_tip.category = "Ruby"
#   new_tip.user_created = true
#
#   junk_url = link_and_description.first.search('.r').search('a').attr('href').text
#   new_tip.url = junk_url.split('?q=')[1].split('&sa=')[0]
#
#   new_tip.save!
#   new_tip.save_tip_from_search(user)
# end
Startup.start 
