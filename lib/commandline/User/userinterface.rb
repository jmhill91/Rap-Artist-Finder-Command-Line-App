require 'pry'

class UserInterface

  def self.lets_start
    system 'clear'
    Startup.logo
    puts 'Welcome to Rapper Finder'
    puts "\n"
    prompt = TTY::Prompt.new
    options = ["Find a feature", "Find by gender", "Find by Region", "Find a Song", "Find an Artist", "Exit"]
    nav = prompt.select("What would you like to do?" + "\n", options)
    if nav == "Find a feature"
      feat_name = prompt.ask("Which featuring artist are you looking for?")
        puts Rapper.find_feature(feat_name)
      sleep 5
      self.lets_start
    elsif nav ==  "Find by gender"
      sex = prompt.ask("Male or Female?")
      puts Rapper.find_by_gender(sex.downcase)
      sleep 10
      self.lets_start

    elsif nav == "Find by Region"
      locay = prompt.ask("Where are you looking for East Coast, West Coast, Southern, or International?")
        puts Rapper.find_by_region(locay)
        sleep 10
      self.lets_start

    elsif nav ==  "Find a Song"
      self.find_song
    elsif nav == "Find an Artist"
      self.find_artist
    else nav == "Exit"
      Startup.exit
    end
  end

    def self.find_song
      prompt = TTY::Prompt.new
      rap_name = prompt.ask("Which rapper do you want to know the songs of?")
        found_rapper = Rapper.find_by(name: rap_name)
        if found_rapper != nil
        puts  found_rapper.all_songs
        sleep 7
        else
          puts "Can't find artist"
          sleep 7
        end
      self.lets_start
    end

    def self.find_artist
      prompt = TTY::Prompt.new
      song_name = prompt.ask("Which song do you want to know the rapper of?")
        songs = Song.all.where(title: song_name)
         if songs != nil
        rap =  songs.map do |song|
           if song.rappers[0] == nil
             "no artist"
           else
             song.rappers[0].name
           end
        end
          rap.each do |artist|
            puts artist
          end
        sleep 5
        else
          puts "Can't find song."
          sleep 5
        end
      self.lets_start
    end

end
