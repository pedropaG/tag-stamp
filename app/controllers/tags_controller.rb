require 'open-uri'
class TagsController < ApplicationController

	def index
		@user = current_user
		@records = Order.from_user(@user)
		@records = @records.unprinted unless params[:all]
	end

	def upload_file
		file = params[:file] if params[:file]
		file ||= open(params[:file_url])
		
		tempfile_path = Rails.root.join('tmp', 'orders.csv')
		File.open(tempfile_path, "w+") do |f|
			f.write(file.read.force_encoding('UTF-8'))
		end
		tempfile = File.open(tempfile_path)
		
		begin
			wb = Workbook::Book.open tempfile.path
			columns_header = {}	
			wb.sheet.table.each_with_index do |row, index|
				if index == 0
					columns_header = get_header(row)
				elsif columns_header.present?
					logger.debug columns_header.inspect
					order_number = row[columns_header[:order_number]].try(:value).try(:to_i)
					order = Order.find_or_initialize_by( number: order_number )
					#if !order.persisted?
						order.full_name = row[columns_header[:full_name]].try(:value)
						order.street = row[columns_header[:street]].try(:value)
						order.street2 = row[columns_header[:street2]].try(:value)
						order.city = row[columns_header[:city]].try(:value)
						order.state = row[columns_header[:state]].try(:value)
						zip_value = row[columns_header[:zip_number]].try(:value)
						order.zip_number = is_number?(zip_value) ? zip_value.to_i.to_s : zip_value
						order.country = row[columns_header[:country]].try(:value)
						order.user = current_user
						order.save
					#end
				end
			end
		rescue => e
			flash[:error] = e.message
		end
		
		flash[:now] = t(:imported_successfully) unless flash[:error]
		redirect_to tags_path
	end

	def preview
		@records = params[:orders].map {|id| Order.find(id) }
		
	end

	protected

	def get_header(wb_table)
		header = {}
		wb_table.each_with_index do |column, index|
			if column.value == column_name(:order_number)
				header[:order_number] ||= index
			elsif column.value == column_name(:full_name)
				header[:full_name] ||= index
			elsif column.value == column_name(:street)
				header[:street] ||= index
			elsif column.value == column_name(:street2)
				header[:street2] ||= index
			elsif column.value == column_name(:city)
				header[:city] ||= index
			elsif column.value == column_name(:state)
				header[:state] ||= index
			elsif column.value == column_name(:zip_number)
				header[:zip_number] ||= index
			elsif column.value == column_name(:country)
				header[:country] ||= index
			end	
		end
		header
	end

	def column_name(column)
		name = current_user.send(column)
		name ||= t(column, scope: :csv_columns)
		name
	end

	def is_number?(value)
		true if Float(value) rescue false
	end

end
