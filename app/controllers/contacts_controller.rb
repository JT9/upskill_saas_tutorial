class ContactsController < ApplicationController
  #Look for view file in views->contacts->new.html.erb
  #GET request to /contact-us
  #Show new contact form
   def new
     #model file contact.rb
     @contact = Contact.new
   end
   
   #POST request /contacts from routes.db
   def create
     #Mass assignment of form fields into Contact object
     #{name: 'asdf', email: 'asdf', comments: 'asdf'}
     @contact = Contact.new(contact_params) 
     #Save the Contact object to database
     if @contact.save
       #Store form fields via parameters into local variables
       #lift information after it has been saved from contact form 
       #to be stored in 3 variables
       name = params[:contact][:name]
       email = params[:contact][:email]
       body = params[:contact][:comments]
       #Plug variables into Contact Mailer email method and send email
       #Used to email out the information
       ContactMailer.contact_email(name, email, body).deliver
       #Store success message into flash hash
       #and redirect to the new action
       flash[:success] = "Message Sent."
       redirect_to new_contact_path #runs new action for a new obj to start another form
     else
       #If Contact object doesn't save,
       #Store errors in flash hash, and redirect to the new action
       #Comma separation of error with join
       flash[:danger] = @contact.errors.full_messages.join(", ")
       # {key: value, key: value, error: "Name can't be blank"}
       #for :error hash[:key]
       redirect_to new_contact_path
     end
   end
   
   private
    #To collect data from form, we need to use
    #strong parameters and whitelist form fields
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
    
end