class ID ### Assigns the user and account and stores the values of the username and password
  attr_accessor :password, :username
  def initialize(password, username)
    @password = password
    @username = username
  end
end

class Message ### This controls all the messages, and it contains the username of the person that sent the message
  attr_accessor :post, :username
  def initialize(post)
    @username = $currentUser
    @post = post
  end
end

$ids = [] ### Holds all the ID classes
$posts = [] ### Holds all the Post classes.
$usernames = ["admin"] ### This is the list of all the usernames, so no duplicate usernames can be used
$currentUser = "" ### Stores the current Username of the logged in person for the messaging commands

$ids.append(ID.new("admin", "admin")) ### Puts the default user into the $ids

def Main() ### Handles the navigation of everything
  puts "Welcome to Soho, would you like to log in, or create a new account?"
  lORc = "" ### lORc means login or create
  until lORc.upcase == "1" or lORc.upcase == "2"
    puts "1: Login"
    puts "2: Create Account"
    print "[1/2]: "
    lORc = gets().chomp
  end
  if lORc == "1"
    LoginUser()
  else
    x = Username() ### These are seperate for easy re-running incase of incorrect credentials
    y = Password()
    $ids.append(ID.new(y,x)) ### Puts the newly created account into $ids
    Main()
  end
end

def LoginUser()
=begin
    line 42-67 and line 69-84
    This function controls the user login.
    It iterates thru all the values in $ids
    and checks it against what the user has
    put in userName. It goes thru all of them
    and if the userName is in it will send them
    to the next fuction, to get the password
=end

  puts
  puts "You may type exit to return to login screen."
  print "Username: "
  userName = gets().chomp
  if userName.upcase == "EXIT"
    Main()
  end
  $currentUser = userName
  $ids.each do |i|
    next if userName != i.username ### next if is basically a one line if that controls whether the loop keeps going
      LoginPass()
  end
  print "That user wasn't found \n"
  LoginUser() ### Puts you back to username in case you screwed that up
end

def LoginPass ### This is the same as LoginUser, but with the password
  puts
  puts "You may type exit to return to login screen."
  print "Password: "
  userPass = gets().chomp
  if userPass.upcase == "EXIT"
    Main()
  end
  $ids.each do |i|
    next if userPass != i.password
    puts
    Dashboard()
  end
  print "Password incorrect \n"
  LoginUser()
end

def Dashboard ### This is the controller for the dashboard, it handles all the controls for posting and viewing
  x = ""
  until x == "4"
    puts "What would you like to do?"
    puts "1:) New Post"
    puts "2:) View Posts"
    puts "3:) All Posts"
    puts "4:) Logout"
    puts
    print "What will you do?: "
    x = gets.chomp()
    if x == "1"
      PostMaker()
      puts
      puts "Post has been made!"
      puts
    elsif x == "2"
      puts
      PostVeiwer()
      puts
    elsif x == "3"
      AllPosts()
    end
  end
  Main()
end

def AllPosts
  puts ### These are here so that the main posting area
  puts ### is noticeable among all the other things on screen
  puts

  $posts.each do |i|
    print i.username + ": " + i.post + "\n"
    puts
  end

=begin
  line 117-120
  This loops through the values in $posts,
  which contains all the message data, including
  the username. It then prints them out on new lines
  and makes it look fairly decent as well.
  Very proud of this, because it took me
  quite a while to think of doing it this
  way
=end

  puts
  puts
  puts
end

def PostVeiwer
  puts
  $posts.each do |i|
    if i.username == $currentUser
      print i.post + "\n"
    end
  end

=begin
  line 140-145
  This check the value of $posts.username and checks
  it agains the current user. If $posts.username is
  not equal to currentUser it just keeps going till
  it finds the ones that are. This only prints out
  the current users posts, not everyone elses.
=end

  puts
end

def PostMaker
  t = Time.new
  puts
  print "Your message here: "
  $posts.append(Message.new(gets.chomp() + " - [" + t.hour.to_s + ":" + t.min.to_s + "]"))
  ### Line 163 looks like a mess, but it is a really easy way to TimeStamp something and make it work everytime.
end

def Username ### Handles the creation of a new Username
  print "Please Put a new Username:"
  tryUsername = gets().chomp
  conf = "" ### conf means confirmation
  until conf.upcase == "Y" or conf.upcase == "N"
    puts "Does this look right?"
    puts tryUsername ### Repeats it back to make sure it is spelled right
    print "[Y/N]: "
    conf = gets.chomp()
  end
  puts tryUsername
  if conf.upcase == "Y"
    if $usernames.include?(tryUsername)
      puts "Sorry, that usernames is taken"
      Username()
    else
      $usernames.append(tryUsername) ### If all the above it true, your unique username is appended to $usernames
      return tryUsername
    end
  elsif conf.upcase == "N"
    puts "Please re-type your Username"
    puts
    Username()
  end
=begin
    lines 178-181
    Handle the already taken feature, basically
    it parses thru the items in $usernames, and
    if it finds it you cant use it. Simple as that
=end
end

def Password() ### Same as username
  print "Please type a new password: "
  tryPass = gets().chomp
  conf = ""
  until conf.upcase == "Y" or conf.upcase == "N"
    puts "Does this look right?"
    puts tryPass
    print "[Y/N]: "
    conf = gets.chomp()
  end
  if conf.upcase == "Y"
    puts "Wonderful, you will now be taken back to the login screen!"
    puts
    return tryPass
  elsif conf.upcase == "N"
    puts "Please re-type your password"
    puts
    Password()
  end
end

loop do
  Main()
end
