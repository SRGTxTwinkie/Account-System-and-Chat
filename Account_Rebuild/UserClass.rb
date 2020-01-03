class UserClass

  attr_accessor :username, :password, :arrayLoc, :messages

  def initialize(username, password, arrayLoc)
    @messages = []
    @username = username
    @password = password
    @arrayLoc = arrayLoc
  end

  def displayUserName
    puts "User name is \"#{@username}\""
  end

  def displayUserPass
    puts "User password is \"#{@password}\""
  end

  def changeUserName
    system("cls")
    print "What would you like to change your Username to?: "
    @username = conf(gets.chomp)
  end

  def changeUserPass
    system("cls")
    print "What would you like to change your Password to?: "
    @password = conf(gets.chomp)
  end

  def conf(value)
    system("cls")
    puts "Does this look right: \"#{value}\" "
    print "[Y/N]: "
    conf = gets.chomp
    case conf.upcase
    when "Y"
      return value
    when "N"
      changeUserName()
    else
      puts "Please select a given option"
      conf(value)
    end
  end

  def newMessage(message, time)
    fullMessage = "[#{time}]: #{message}"
    @messages.append(fullMessage)
  end

end
