class PoetryMailer < ApplicationMailer

  default from: "poetxt@poetxt.ca"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.poetry_mailer.welcome_email.subject
  #
  def welcome_email(reader)
    @greeting = "Beginnings are poetic, ain't them"
    @reader   = reader 
    mail to: reader.email, subject: "Poeticalnesses"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.poetry_mailer.daily_poetry.subject
  #

  def daily_poetry(reader, daily_poem, title, author, url)
      
    @daily_poem   = daily_poem
    @author       = title
    @title        = author
    @url          = url

    @greeting = "Hi"
    @reader   = reader

    mail to: reader, subject: "Lines from a Poem"
  end
end
