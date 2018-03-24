songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

def help
  puts "I accept the following commands:
- help : displays this help message
- list : displays a list of songs you can play
- play : lets you choose a song to play
- exit : exits this program"
end

def list(songs)
  songs.each_with_index do |song, idx|
    puts "#{idx + 1}. #{song}"
  end
end

def play (songs)
  numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  puts "Please enter a song name or number:"
  requested_song = gets.chomp 
  if numbers.include?(requested_song)
    if requested_song.to_i < songs.length
      puts "Playing #{songs[requested_song.to_i - 1]}"
    else
      puts "Invalid input, please try again"
    end
  elsif requested_song.is_a? String
    if songs.include?(requested_song)
      puts "Playing #{requested_song}"
    else 
      puts "Invalid input, please try again"
    end
  end
end

def exit_jukebox
  puts "Goodbye"
end

def run(songs)
  help
  user_input = ""
  until user_input == "exit"
    puts "Please enter a command:"
    user_input = gets.strip
    if user_input == "list"
      list(songs)
    elsif user_input == "play"
      play(songs)
    elsif user_input == "exit"
      exit_jukebox
    end
  end
end