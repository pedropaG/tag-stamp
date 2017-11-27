class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders

  dragonfly_accessor :logo

  def self.permit_columns
	[:email, :password, :password_confirmation, :rows, :columns, :order_name, :street, :street2, :zip_number, :state, :country, :logo_uid, :logo_name, :page_margin_left, :page_margin_right, :page_margin_top, :page_margin_bottom, :tag_margin_left, :tag_margin_right, :tag_margin_top, :tag_margin_bottom, :print_lines, :page_width, :page_height]
  end

  def last_cell_printed
	self[:last_cell_printed] || 0
  end

  def cells_per_page
	rows * columns
  end

  def cell_height
	((page_height - page_margin_bottom - page_margin_top) / rows)
  end

  def cell_width
	((page_width - page_margin_left - page_margin_right) / columns)
  end

  protected

  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end

end
