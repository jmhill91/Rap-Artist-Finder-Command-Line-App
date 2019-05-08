require 'pry'
class RapperInterface

  def self.artist_start
    system 'clear'
    Startup.logo
    prompt = TTY::Prompt.new
    name = prompt.ask("What is your name?") do |q|
      q.required true
      q.modify   :titleize
    end
    # @name = name.find_artist
     self.find_artist(name)
  end

  def self.find_artist(user_input)
    found_name=Rapper.find_by(name: user_input)
    if found_name != nil
      self.rap_options(found_name)
    else
      puts "Can't find artist"
      sleep 5
      self.artist_start
    end
  end

  def self.rap_options(rapper_instance)
    system 'clear'
    prompt = TTY::Prompt.new
    puts "What do you need to do today?"
    puts "\n"
    choices = ["Create Song", "Edit Feature", "Remove Feature", "Delete Song", "View Songs" , "Nothing"]
    opt = prompt.select('Do you want to".' + "\n", choices)

    if opt == "Create Song"
      song = prompt.ask("What is the song name") do |q|
        q.required true
        q.modify :titleize
      end
    feat = prompt.ask("Is there a feature") do |q|
      q.required false
    end
    rapper_instance.new_song(song, feat)
    self.rap_options(rapper_instance)

  # elsif opt == "Missing Song?"
  #     missed_song = prompt.ask('What song is missing?') do |q|
  #       q.required true
  #     end
  #     rapper_instance.find_missing_song(missed_song)
  #     rapper_instance.all_songs
  #     sleep 6
  #     self.rap_options(rapper_instance)

    elsif opt == "Edit Feature"
      update_song = prompt.ask('What songs feat needs updating?') do |q|
        q.required true
      end
      new_feat = prompt.ask('Who do you want to change the feature to?') do |q|
      q.required true
      end
      rapper_instance.edit_feature(update_song, new_feat)
      self.rap_options(rapper_instance)

    elsif opt == "Remove Feature"
      del_feat = prompt.ask('What song do you want to remove the feature from?') do |q|
        q.required true
      end
      rapper_instance.delete_feature(del_feat)
      self.rap_options(rapper_instance)

    elsif opt == "Delete Song"
      del_song = prompt.ask('What song do you want to delete?') do |q|
        q.required true
      end
      rapper_instance.delete_entire_song(del_song)
      self.rap_options(rapper_instance)

    elsif opt == "View Songs"
      puts rapper_instance.all_songs
      sleep  10
      self.rap_options(rapper_instance)

    elsif opt == "Nothing"
      Startup.exit
    end
  end

end
