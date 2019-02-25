class Contact < ActiveRecord::Base
  #Contact form validations
  #Validate data for contact form to save to database
  validates :name, presence: true
  validates :email, presence: true
  validates :comments, presence: true
    
end
