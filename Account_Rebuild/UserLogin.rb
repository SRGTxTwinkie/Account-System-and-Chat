class UserLogin

  def initialize

  end

  def userNameGet(allUsers)
    system("cls")
    puts "Please enter your username"
    user = gets.chomp
    for i in allUsers
      if i.username == user
        userPassGet(i)
        return i
      else
        next
      end
      puts "Sorry, that account was not found"
      return
    end
  end

  def userPassGet(user)
    puts "Please enter your password"
    pass = gets.chomp
    if user.password == pass
      return
    else
      puts "Password not recognised"
    end
  end

end
