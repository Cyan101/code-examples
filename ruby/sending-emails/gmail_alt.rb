require 'mail'

  class GmailAccount
    attr_reader :user_name
    attr_reader :email_address
    attr_reader :password

    def initialize(user_name, password)
      @user_name = username
      @email_address = user_name + "@gmail.com"
      @password = password
    end

    def send!(address, subj, message)
      mail = Mail.new do
        from @email_address
        to address
        subject subj
        html_part do
          content_type 'text/html; charset=UTF-8'
          body "<div style='font-family: monospace;'>" + message + "</div>"
        end
      end

      mail.delivery_method(
        :smtp,
        address: 'smtp.gmail.com',
        domain: 'gmail.com',
        port: 587,
        user_name: username,
        password: password,
        authentication: 'plain',
        enable_starttls_auto: true
      )

      mail.deliver!
    end
  end
end

#Example Usage:
#gmail = GmailAccount.new('some email', 'some password')
#gmail.send!('xxxxx@gmail.com', 'Hello', 'World!')
