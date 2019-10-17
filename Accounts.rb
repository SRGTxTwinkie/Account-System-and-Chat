class ID
  attr_accessor :password, :username
  def initialize(password, username)
    @password = password
    @username = username
  end
end

class Message < ID
  attr_accessor :messages
def initialize(messages)
  @messages = array.new
end
end

$main = true
$ids = []
$posts = []
$usernames = []

$ids.append(ID.new("admin", "admin"))

def Main()
  puts "Welcome to Soho, would you like to log in, or create a new account?"
  lORc = ""
  until lORc.upcase == "1" or lORc.upcase == "2"
    puts "1: Login"
    puts "2: Create Account"
    print "[1/2]: "
    lORc = gets().chomp
  end
  if lORc == "1"
    LoginUser()
  else
    x = Username()
    y = Password()
    $ids.append(ID.new(y,x))
    Main()
  end
end

def LoginUser()
  print "Username: "
  userName = gets().chomp
  $usernames = []
  $usernames.append(userName)
  $ids.each do |i|
    next if userName != i.username
      LoginPass()
  end
  print "That user wasn't found \n"
end

def LoginPass
  print "Password: "
  userPass = gets().chomp
  $ids.each do |i|
    next if userPass != i.password
    Dashboard()
  end
  print "That user wasn't found \n"
end

def Dashboard
  x = ""
  until x == "3"
    puts "What would you like to do?"
    puts "1:) New Post"
    puts "2:) View Posts"
    puts "3:) Logout"
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
    end
  end
  $posts = []
  Main()
end

def PostVeiwer
  $posts.each do |i|
    print $usernames.to_s + " :" + i.to_s + "\n"
  end
end

def PostMaker
  $posts.append(gets.chomp())
end

def Username
  print "Please Put a new Username:"
  tryUsername = gets().chomp
  conf = ""
  until conf.upcase == "Y" or conf.upcase == "N"
    puts "Does this look right?"
    puts tryUsername
    print "[Y/N]: "
    conf = gets.chomp()
    return tryUsername
  end
  if conf.upcase == "Y"
  elsif conf.upcase == "N"
    puts "Please re-type your Username"
    puts
    Username()
  end
end

def Password()
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
