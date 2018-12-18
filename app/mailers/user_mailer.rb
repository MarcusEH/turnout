class UserMailer < ApplicationMailer
  default from: "turnoutappuser@gmail.com"
  def welcome_email
    @user = params[:user]
    @url = 'http://localhost:8080/#/login'
    mail(to: @user.email, subject: `Welcome to TURNOUT`)
  end

  def group_email
    @user = params[:user]
    p params
    @body = params[:body]
    mail(
      to: @user.email,
      content_type: "text/html",
      body: params[:body],
      subject: "A message from your TURNOUT group!"
    )
  end
end
