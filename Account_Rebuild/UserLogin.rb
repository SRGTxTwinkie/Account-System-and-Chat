class UserLogin

  def initialize

  end

  def userNameGet(allUsers)
    system("cls")
    puts "Please enter your username"
    user = gets.chomp
    for i in allUsers
      if i.username == user
        userPassGet(allUsers)
        next
      else
        next
      end
      puts "Sorry, that account was not found"
      return
    end
  end

    def userPassGet(allUsers)
      puts "Please enter your password"
      pass = gets.chomp
      for i in allUsers
        if i.password == pass
          puts "You are now logged in"
          return pass
        else
          next
        end
      end
    end
end
