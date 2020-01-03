class CreateUser

  attr_accessor :arrayMain

  def initialize

  end

  def userCreate(allUsers)
    puts "Please create a new Username"
    print "Username: "
    username = gets.chomp
    until conf(username, allUsers) == 1
      print "Username: "
      username = gets.chomp
      for i in allUsers
        if i.username == username
          puts "That username has already been taken"
        else
          next
        end
      end
    end
    puts "Please create a new Password"
    print "Password: "
    password = gets.chomp
    until conf(password, allUsers) == 1
      print "Password: "
      password = gets.chomp
    end
    userConf(username, password, allUsers)
  end

  def userConf(user, pass, allUsers)
    system("cls")
    puts "Does this look right to you?"
    puts "Username: \"#{user}\""
    puts "Password: \"#{pass}\""
    print "[Y/N]: "
    temp = gets.chomp.upcase
    if temp == "Y"
      return user, pass
    elsif temp == "N"
      return 0
    else
      puts "Command not recognised"
      userConf(user,pass)
    end
  end

  def conf(value, allUsers)
    system("cls")
    puts "Does this look right: \"#{value}\" "
    print "[Y/N]: "
    conf = gets.chomp
    case conf.upcase
    when "Y"
      return 1
    when "N"
      return 0
    else
      puts "Please select a given option"
      conf(value, allUsers)
    end
  end
end
