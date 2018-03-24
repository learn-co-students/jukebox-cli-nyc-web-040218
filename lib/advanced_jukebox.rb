#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

# my_songs = {
# "Go Go GO" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/01.mp3',
# "LiberTeens" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/02.mp3',
# "Hamburg" =>  '< path to this directory >/jukebox-cli/audio/Emerald-Park/03.mp3',
# "Guiding Light" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/04.mp3',
# "Wolf" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/05.mp3',
# "Blue" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/06.mp3',
# "Graduation Failed" => '< path to this directory >/jukebox-cli/audio/Emerald-Park/07.mp3'
# }
require 'pry'

def help
  puts "I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program"
end

def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and 
  #list the songs by name
  i = 1
  my_songs.map do |titles, paths|
    puts "#{i}. #{titles}"
    i += 1
  end
end


def play(my_songs)
  puts "Please enter a song name or number:"
  input = gets.chomp
  if my_songs.keys.include?(input)
    puts "Playing #{input}"
    system "open #{my_songs[input]}"
  elsif (1..7).include?(input.to_i)
    puts "Playing #{my_songs.keys[input.to_i - 1]}"
    system "open #{my_songs.values[input.to_i - 1]}"
  elsif input == "shuffle" || input.include?("rand")
    puts "Playing #{my_songs.keys[rand(1..7)]}"
    system "open #{my_songs.values[rand(1..7)]}"
  else
    puts "Invalid input, please try again. Try 'help' for options"
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(my_songs)
  help
  puts "Please enter a command:"
  input = gets.chomp
  
  until input == "exit" || input == "quit"
    if input == "help"
      help
    elsif input == "list" || input == "songs"
      list(my_songs)
    elsif input == "play"
      play(my_songs)
    else
      puts "Invalid input, please try again. Try 'help' for options"
    end
  puts "Please enter a command:"
  input = gets.chomp
  end
  exit_jukebox
end
