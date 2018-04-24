def welcome
  puts <<-'EOF'
      _______.___________.    ___      .______         ____    __    ____  ___      .______          _______.        ___      .______    __
     /       |           |   /   \     |   _  \        \   \  /  \  /   / /   \     |   _  \        /       |       /   \     |   _  \  |  |
    |   (----`---|  |----`  /  ^  \    |  |_)  |        \   \/    \/   / /  ^  \    |  |_)  |      |   (----`      /  ^  \    |  |_)  | |  |
     \   \       |  |      /  /_\  \   |      /          \            / /  /_\  \   |      /        \   \         /  /_\  \   |   ___/  |  |
 .----)   |      |  |     /  _____  \  |  |\  \----.      \    /\    / /  _____  \  |  |\  \----.----)   |       /  _____  \  |  |      |  |
 |_______/       |__|    /__/     \__\ | _| `._____|       \__/  \__/ /__/     \__\ | _| `._____|_______/       /__/     \__\ | _|      |__|

 EOF
# puts out a welcome message here!
end

def get_character_from_user
  puts "please enter a character"
  print "> "
  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
