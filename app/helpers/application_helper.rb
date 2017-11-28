module ApplicationHelper

  def check_box_tag(name, value="1", checked= false, options = {})
        tag("input", type: :hidden, hidden:true, value: 0, name: name) + super(name, value, checked, options)
  end

  def tag_box_text(order)
	order.print_text.present? ? order.print_text : [order.full_name, order.full_address, order.zip_and_city, order.state_and_country].join("\n")
  end

  def tag_box_html(order)
	raw tag_box_text(order).gsub!("\n", "<br>")
  end

end
