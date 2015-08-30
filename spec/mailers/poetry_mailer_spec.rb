require "rails_helper"

RSpec.describe PoetryMailer, :type => :mailer do
  describe "welcome_email" do
    let(:mail) { PoetryMailer.welcome_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "daily_poetry" do
    let(:mail) { PoetryMailer.daily_poetry }

    it "renders the headers" do
      expect(mail.subject).to eq("Daily poetry")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
