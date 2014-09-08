###need to add in inventory###

#This will store the items that the player is carrying in an array
@inventory = []

# This inserts a prompt before user input
def prompt()
  print "Please enter a command >"
end

# This gives the player a list of commands to use in game
def help()
  @help = help
  <<-"*"
  "Here is a list of commands that you can use:
  go (direction): will take you to the direction entered
  look: will give you a description of the room you are currently in
  open: will open doors, boxes, other closed objects
  pick up (item): will put the item in your inventory
  use (item): will take item out of inventory for you to use
  inventory: will list the amount of items you are carrying
  quit: will stop the game (but you won't quit because you\'re a winner)"
  *
end

# Shows the user the items
def inventory()
  puts "You are carrying the following items:"
  puts @inventory
end

def look()
  @player.location.full_description
end

class Dungeon
  attr_accessor :player

  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end

  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def start.description
  my_dungeon.start(:largeroom)
    <<-"*"
  "You are standing inside of a large room. There are doors in all directions.
  Where would you like to go, north, south, east, or west?"
  *
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference }
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end

  class Player
    attr_accessor :name, :location

    def initialize(name)
      @name = name
    end
    def look
      puts location.description
    end
  end

  class Room
    attr_accessor :reference, :name, :description, :connections

    def initialize(reference, name, description, connections)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
    end

    def full_description
      @name + "\n\nYou are in " + @description
    end
  end

#While input does not equal exit
  def intro
    puts "Welcome to Riley's Dungeon of Doom!"
    puts "Before you"
    puts ""
  end

  def input
    input
  end

#exits the game
  def quit
    Process.exit
  end

  def instructions
    while input != "" do
      puts "Please tell me where you\'d like to go."
      direction = gets.chomp
    end
  end

  def largeroom
    puts @description

    while true
      prompt; direction = gets.chomp
      if direction == "west"
      smallroom()
      end
      if direction == "east"
      foyer()
      end
      if directon == "south"
      patio()
      end
      if direction == "north"
      closet()
      end
      if direction == "help"
        help; prompt; direction = gets.chomp
      if direction == "inventory"
        inventory; prompt; direction = gets.chomp
      if direction == "look"
        look; prompt; direction = gets.chomp
      else
      puts "There are no doors in this direction."
      puts "What else would you like to do?"
      prompt; direction = gets.chomp
    end

    def smallroom
      @description
      prompt; direction = gets.chomp

      while true
        if direction == "east"
          largeroom()
        if direction == "west"
          puts "There are no doors west of the smallroom."
        if direction == "north"
          puts "There are no doors north of you."
        if direction == "south"
          puts "There are no doors south of you."
        if direction == "help"
          help; prompt; direction = gets.chomp
        if direction == "inventory"
          inventory; prompt; direction = gets.chomp
        if direction == "look"
          look; prompt; direction = gets.chomp
        else
        puts "There are no doors in this direction."
        puts "What else would you like to do?"
        prompt; direction = gets.chomp
      end
    end

    def foyer
      @description
      prompt; direction = gets.chomp

      while true
        if direction == "east"
          puts "There are no doors east of the foyer."
        if direction == "north"
          puts "There are no doors north of the foyer."
        if direction == "west"
          @largeroom
        if direction == "south"
          puts "There are no doors south of the foyer."
        if direction == "help"
          help; prompt; direction = gets.chomp
        if direction == "inventory"
          inventory; prompt; direction = gets.chomp
        if direction == "look"
          look; prompt; direction = gets.chomp
        else
        puts "There are no doors in this direction."
        puts "What else would you like to do?"
        prompt; direction = gets.chomp
      end
    end

    def closet
      @description
      prompt; direction = gets.chomp

      while true
        if direction == "east"
          puts "There are no doors east of the foyer."
        if direction == "north"
          puts "There are no doors north of the foyer."
        if direction == "west"
          puts "There are no doors south of the foyer."
        if direction == "south"
          @largeroom
        if direction == "help"
          help; prompt; direction = gets.chomp
        if direction == "inventory"
          inventory; prompt; direction = gets.chomp
        if direction == "look"
          look; prompt; direction = gets.chomp
        else
        puts "There are no doors in this direction."
        puts "What else would you like to do?"
        prompt; direction = gets.chomp
      end
    end

    def patio
      @description
      prompt; direction = gets.chomp

        while true
          if direction == "east"
            puts "There are no doors east of the foyer."
          if direction == "south"
            puts "There are no doors north of the foyer."
          if direction == "west"
            puts "There are no doors south of the foyer."
          if direction == "north"
            @largeroom
          if direction == "help"
            help; prompt; direction = gets.chomp
          if direction == "inventory"
            inventory; prompt; direction = gets.chomp
          if direction == "look"
            look; prompt; direction = gets.chomp
          else
          puts "There are no doors in this direction."
          puts "What else would you like to do?"
          prompt; direction = gets.chomp
        end
    end
end


# Create the main dungeon object
$my_dungeon = Dungeon.new("Janice Foster")
#puts my_dungeon.player.name

# Add rooms to the dungeon
$my_dungeon.add_room(:largeroom, "Large Room", "a large room",{
  :west => :smallroom, :north => :closet })
$my_dungeon.add_room(:smallroom, "Small Cave", "a small, claustrophobic room", {
  :east => :largeroom })
$my_dungeon.add_room(:closet, "Closet", "a closet", {
  :south => :largeroom })
$my_dungeon.add_room(:patio, "Patio", "a spacious outdoor patio with barred
  windows. There is no escape.", { :north => :largeroom })
$my_dungeon.add_room(:foyer, "Foyer", "the entrance to the dungeon. There is a
  door that leads outside.", {:west => :largeroom })
#Start the dungeon by placing the player in the large cave

end
