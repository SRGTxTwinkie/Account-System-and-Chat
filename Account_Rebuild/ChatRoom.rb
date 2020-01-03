require 'time'

class ChatRoom

  def initialize()
    @t = Time.new
    @currentUser = nil
    @messages = []
  end

  def menu
    command = nil
    until command == "3"
      puts """
1) New Message
2) View Chatroom
3) Logout
  """
      print "Option: "
      command = gets.chomp
      case command
      when "1"
        newMessage()
      when "2"
        viewChatroom()
      when "3"
        puts @currentUser.username
        puts @currentUser.password
      end
    end
  end

  def newMessage
    print "What is your message: "
    message = gets.chomp
    count = message.split("").count
    formatMessage = """
[#{(@t.strftime("%k:%M")).strip} | #{@currentUser.username}]
  #{message}
  #{"_"* (count + 3)}
"""
    @currentUser.messages.append(formatMessage)
    @messages.append(formatMessage)
  end

  def viewChatroom
    @messages.each do |i|
      puts i
    end
    puts
  end

  def newUser(user)
    @currentUser = user
    menu()
  end

end
