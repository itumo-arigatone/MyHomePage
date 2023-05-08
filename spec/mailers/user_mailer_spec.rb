require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "user mailer" do
    let(:user) { create(:user) }

    it "account_activation" do
      mail = UserMailer.account_activation(user)
      expect(mail.subject).to eq("Account activation")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["noreply@example.com"])
      expect(mail.body.encoded).to match("Hi")
    end

    # it "password_reset" do
    #   reset_mail = UserMailer.password_reset(user)
    #   expect(reset_mail.subject).to eq("Password reset")
    #   expect(reset_mail.to).to eq([user.email])
    #   expect(reset_mail.from).to eq(["noreply@example.com"])
    #   expect(reset_mail.body.encoded).to match("Hi")
    # end
  end
end
