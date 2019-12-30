class CreateUser

  attr_accessor :arrayMain

  def initialize

  end

  def userCreate(allUsers)
    puts "Please create a new Username"
    print "Username: "
    username = conf(gets.chomp)
    for i in allUsers
      if i.username == username
        puts "That username has already been taken"
        userCreate()
      else
        next
      end
    end
    puts "Please create a new Password"
    print "Password: "
    password = conf(gets.chomp)
    userConf(username, password)
  end

  def userConf(user, pass)
    system("cls")
    puts "Does this look right to you?"
    puts "Username: \"#{user}\""
    puts "Password: \"#{pass}\""
    print "[Y/N]: "
    temp = gets.chomp.upcase
    if temp == "Y"
      return user, pass
    elsif temp == "N"
      userCreate()
    else
      puts "Command not recognised"
      userConf(user,pass)
    end
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
      userCreate()
    else
      puts "Please select a given option"
      conf(value)
    end
  end
end
