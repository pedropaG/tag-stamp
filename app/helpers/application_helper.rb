module ApplicationHelper

  def check_box_tag(name, value="1", checked= false, options = {})
        tag("input", type: :hidden, hidden:true, value: 0, name: name) + super(name, value, checked, options)
  end

end
