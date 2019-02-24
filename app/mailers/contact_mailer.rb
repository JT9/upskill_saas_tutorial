#Used to email out your contact form
class ContactMailer < ActionMailer::Base
    default to: 'sbc2105@gmail.com'
    
    def contact_email(name, email, body)
      @name = name
      @email = email
      @body = body
      
      mail(from: email, subject: 'Contact Form Message')
    end
    
end