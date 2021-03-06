class UserMailer < ApplicationMailer
    def signup(user)
        @user = user
       
        @greeting = "Thank you for your support and volunteering:
         Use this email address to login #{@user.email}. You will need to choose the option 'Forgot Password?' to
         set your new password. 
         "
        mail(
        to: @user.email,
        from: 'tractionapp@gmail.com',
        subject: 'Welcome to Traction App!'
      )
    end
end
