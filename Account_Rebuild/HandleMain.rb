require_relative "UserClass.rb"
require_relative "UserLogin.rb"
require_relative "CreateUser.rb"
require_relative "UserClass.rb"

class Main
  def initialize()
    @universalCounter = 0
    @allUsers = [UserClass.new("1402","admin", 0)]
    @createUser = CreateUser.new()
    @userLogin = UserLogin.new()
    @selected_user = nil
    main()
  end

  def main
    system("cls")
    puts "Do you have an account created?"
    print "[Y/N]: "
    ans = gets.chomp
    if ans.upcase == "Y"
      password = @userLogin.userNameGet(@allUsers)
      puts password
      system("pause")
    elsif ans.upcase == "N"
      temp = @createUser.userCreate(@allUsers)
      @allUsers.append(UserClass.new(temp[0],temp[1],@allUsers.count))
    elsif ans.upcase == "MENU"
      menu()
    else
      puts "That commands was not recognised, please try again"
      main()
    end
    main()
  end

  def menu()
    puts """
COMMAND: LIST_USERS
COMMAND: CHOOSE_USER
COMMAND: CHECK_CURRENT_USER
COMMAND: CHECK_NAME
COMMAND: CHECK_PASS
COMMAND: CHECK_LOCATION
"""
    command = gets.chomp.upcase
    begin
      case command
        when "LIST_USERS"
          x = 0
          for i in @allUsers
            puts "User #{x}: #{i.username}"
            x += 1
          end
        when "CHOOSE_USER"
          user = gets.chomp
          for i in @allUsers
            case i.username
              when user
                @selected_user = i
            end
          end
          if @selected_user == nil
            puts "User Not Found"
          end
        when "CHECK_NAME"
          puts @selected_user.username
          system("pause")
          system("cls")
        when "CHECK_PASS"
          puts @selected_user.password
          system("pause")
          system("cls")
        when "CHECK_LOCATION"
          puts @selected_user.arrayLoc
          system("pause")
          system("cls")
        when "CHECK_CURRENT_USER"
          puts @selected_user
          puts @selected_user.username
          system("pause")
          system("cls")
        when "EXIT"
          main()
      end
        menu()
    rescue
      puts
      puts "ERROR NO USER SELECTED"
      system("pause")
      system("cls")
      puts
      menu()
    end
  end

end

Main.new()
