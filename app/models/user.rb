class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates :first_name,  presence: true, length: { maximum: 50 }    
    validates :last_name,  presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 50 }, uniqueness: {case_sensitive: false}   

  def self.find_first_by_auth_conditions(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
  	  where(conditions.to_hash).where("lower(name) = :value OR lower(email) = :value", value:login.downcase).first	
  	else  
  	  where(conditions.to_hash).first		
    end		
  end    
  

end
