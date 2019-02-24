class ContactsController < ApplicationController
   def new #Look for view file in views->contacts->new.html.erb
     @contact = Contact.new #model file contact.rb
   end
   
   def create
     @contact = Contact.new(contact_params) #{name: 'asdf', email: 'asdf', comments: 'asdf'}
     if @contact.save
       #lift information after it has been saved from contact form
       name = params[:contact][:name]
       email = params[:contact][:email]
       body = params[:contact][:comments]
       #Used to email out the information
       ContactMailer.contact_email(name, email, body).deliver
       flash[:success] = "Message Sent."
       redirect_to new_contact_path
     else
       flash[:danger] = @contact.errors.full_messages.join(", ") #Comma separation of error with join
       # {key: value, key: value, error: "Name can't be blank"} for :error hash[:key]
       redirect_to new_contact_path
     end
   end
   
   private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
    
end