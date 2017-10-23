module TagsHelper

	# PREVIEW
	def order_by_cell(cell, page, record_number, records)
		if (page > 1 || cell > current_user.last_cell_printed) && record_number < records.size
			records[record_number]
		end
	end

	def total_pages(records)
		records.size / current_user.cells_per_page + 1
	end

	def row_height
		1000 / current_user.rows
	end

	def cell_width
		100 / current_user.columns
	end

	# AUTO IMPORT

	def month
		Date.today.month
	end

	def year
		Date.today.year
	end

	def real_column(number)
		(number % current_user.columns).to_i + 1
	end
end
