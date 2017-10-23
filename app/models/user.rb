class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  dragonfly_accessor :logo

  def self.permit_columns
	[:email, :password, :password_confirmation, :rows, :columns, :order_name, :street, :street2, :zip_number, :state, :country, :logo_uid, :logo_name]
  end

  def last_cell_printed
	self[:last_cell_printed] || 0
  end

  def cells_per_page
	rows * columns
  end

  def cell_height
	page_height / rows
  end

  def cell_width
	page_width / columns
  end

  protected

  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end

end
