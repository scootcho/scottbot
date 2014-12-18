class ContactMailer < ActionMailer::Base
  default from: "scott.tj.yu@gmail.com"

  def notify(email, name, subject, message)
    @email, @name, @subject, @message = email, name, subject, message 
    mail(to: "scott.tj.yu@gmail.com", subject: "You got mail!")
  end


end
