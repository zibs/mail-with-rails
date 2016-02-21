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

    @greeting = ["Hullo", "Salut", "Greetings", "G'Mawrning!", "Jolly-Daydums to you, ", "Ahoy!", "Enjoy this most sweet and blessed day before you, ", "Another day, another dollar, ", "Another day, another poem", "Spring's nearly here, ", " :) "].sample
    @emoji = ["🌞", "🍀", "🌺", "🍇", "🍉", "🍟", "🍼"].sample
    @reader   = reader.name
    mail to: reader.email, subject: "#{@title}"
  end
end
