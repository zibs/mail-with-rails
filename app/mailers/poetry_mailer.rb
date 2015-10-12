class PoetryMailer < ApplicationMailer

  default from: "pomz@poetxt.ca"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.poetry_mailer.welcome_email.subject
  #
  def welcome_email(reader)
    @reader   = reader.name 
    mail to: reader.email, subject: "Poematic"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.poetry_mailer.daily_poetry.subject
  #

  def daily_poetry(reader, daily_poem, title, author, url, glossary_page, glossary_term)
      
    @daily_poem    = daily_poem
    @author        = author
    @title         = title
    @poem_url      = url
    @glossary_page = glossary_page
    @glossary_term = glossary_term

    @greeting = "Hi"
    @reader   = reader.name

    mail to: reader.email, subject: "#{@title}"
  end
end
