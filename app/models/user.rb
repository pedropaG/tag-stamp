class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  dragonfly_accessor :logo

  def permit_params
	[:email, :password, :password_confirmation, :rows, :columns, :order_name, :street, :street2, :zip_number, :state, :country, :logo_uid, :logo_name]
  end

end
