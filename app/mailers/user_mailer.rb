class UserMailer < ApplicationMailer
  default from: "turnoutappuser@gmail.com"
  def welcome_email
    @user = params[:user]
    @url = 'http://localhost:8080/#/login'
    mail(to: @user.email, subject: `Welcome to TURNOUT`)
  end
end
