class AdminUser < ApplicationRecord
  self.table_name = "users"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_secure_token
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  include Mygem::UserScope
end
