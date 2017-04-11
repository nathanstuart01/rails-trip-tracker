# Preview all emails at http://localhost:3000/rails/mailers/signup_mailer
class SignupMailerPreview < ActionMailer::Preview
def new_signup_preview
  user = User.first
    SignupMailer.new_signup(user)
end
end
