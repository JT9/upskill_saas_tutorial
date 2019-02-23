class ContactsController < ApplicationController
   def new
     @contact = Contact.new
   end
   
   def create
     @contact = Contact.new(contact_params) #{name: 'asdf', email: 'asdf', comments: 'asdf'}
     if @contact.save
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