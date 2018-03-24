#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

# my_songs = {
# "Go Go GO" => '/Users/ahamedabbas/Desktop/jukebox-cli-nyc-web-040218/audio/Emerald-Park/01.mp3',
# "LiberTeens" => '/Users/ahamedabbas/Desktop/jukebox-cli-nyc-web-040218/audio/Emerald-Park/02.mp3',
# "Hamburg" =>  '/Users/ahamedabbas/Desktop/jukebox-cli-nyc-web-040218/audio/Emerald-Park/03.mp3',
# "Guiding Light" => '/Users/ahamedabbas/Desktop/jukebox-cli-nyc-web-040218/audio/Emerald-Park/04.mp3',
# "Wolf" => '/Users/ahamedabbas/Desktop/jukebox-cli-nyc-web-040218/audio/Emerald-Park/05.mp3',
# "Blue" => '/Users/ahamedabbas/Desktop/jukebox-cli-nyc-web-040218/audio/Emerald-Park/06.mp33',
# "Graduation Failed" => '</Users/ahamedabbas/Desktop/jukebox-cli-nyc-web-040218/audio/Emerald-Park/07.mp3'
# }

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end



def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and
  #list the songs by name
  my_songs.each do |song, file_path|
    puts song
  end
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song name:"
  input = gets.chomp()

  if my_songs[input] != nil
    file_path = my_songs[input]
    system "open #{file_path}"
  else
    "Invalid input, please try again"
  end
end

def exit_jukebox()
  puts "Goodbye"
end

def prompt()
  puts "Please enter a command:"
  gets.chomp()
end

def run(my_songs)
  help()
  input = prompt()

  while input != "exit"
    if input == "list"
      list(my_songs)
      input = prompt()
    elsif input == "play"
      play(my_songs)
      input = prompt()
    elsif input == "help"
      help()
      input = prompt()
    else
      puts "Invalid command"
      help()
      input = prompt()
    end
  end

  exit_jukebox()
end
