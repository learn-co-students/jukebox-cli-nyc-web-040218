require 'pry'

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
# THE HELP METHOD
# This method should puts out the following:
# I accept the following commands:
# - help : displays this help message
# - list : displays a list of songs you can play
# - play : lets you choose a song to play
# - exit : exits this program

  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"

end

def list(array_of_songs)
# This method takes in an argument of the songs array of puts out the following:
# 1. Phoenix - 1901
# 2. Tokyo Police Club - Wait Up
# 3. Sufjan Stevens - Too Much
# 4. The Naked and the Famous - Young Blood
# 5. (Far From) Home - Tiga
# 6. The Cults - Abducted
# 7. Phoenix - Consolation Prizes
# 8. Harry Chapin - Cats in the Cradle
# 9. Amos Lee - Keep It Loose, Keep It Tight

  array_of_songs.each_with_index do |song, index|
    puts "#{(index + 1).to_s}. #{song}"
  end
end

def play(array_of_songs)
# This method also takes in an argument of the songs array.
# It first puts out the prompt: "Please enter a song name or number:".
# It then stores the user's response using gets.chomp.
# If the user's response is a valid song number or song name, the method should puts out: "Playing <song name>".
# Otherwise, it should puts out: "Invalid input, please try again".

  puts "Please enter a song name or number:"
  user_song_selection = gets.chomp
  response = ""
  array_of_songs.each_with_index do |song, index|
    if user_song_selection == (index + 1).to_s || user_song_selection == song
      response = "Playing #{song}"
      break
    else
      response = "Invalid input, please try again"
    end
  end
  puts response
end

def exit_jukebox
# This method is simple. It puts out: "Goodbye".
  puts "Goodbye"
end

def run(songs)
# This method is a little trickier.
# It will use the other methods we built, our "helper" methods, to actually enact the running of our Jukebox.
# First, this method should call on the help method to show the user the available commands.
# Then, it should puts out the prompt: "Please enter a command:".
# It should capture the user's response using gets.chomp or gets.strip.
# We need to keep our program running as long as the user's input is not "exit".
# Use a loop to continue asking the user for input until or unless their input is "exit".
# Use if or case statements to determine how your program will respond to a user's input.
# For example, if their input is "list", call the list method, if their input is "play", call the play method, if their input is "help", call the help method and if their input is "exit", call the exit_jukebox method and break out of your loop to stop the program.

  help
  puts "Please enter a command:"
  user_input = gets.chomp

  while true do
    case
      when user_input == "help"
        help
      when user_input == "list"
        list(songs)
      when user_input == "play"
        play(songs)
      when user_input == "exit"
        exit_jukebox
        break
      else
        help
    end
    puts "Please enter a command:"
    user_input = gets.chomp
  end
end
