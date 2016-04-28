class UserMailer < ActionMailer::Base
  default from: "tigol_bitties@rotten_man_g_oes.com"

  def welcome_email(user)
    @user = user 
    @url = 'localhost:3000'
    mail(to: @user.email, subject: 'Welcome to Rotten Mangoes!')
  end

  def goodbye_email(user)
    @user = user
    @url = 'localhost:3000'
    mail(to: @user.email, subject: 'Have a nice life')
  end

end
