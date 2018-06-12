module ApplicationHelper
  def my_form_for(record, options = {}, &proc)
    form_for(record, options.merge!({builder: MyFormBuilder}), &proc)
  end

  def signed_in?
    !!current_agent
  end
end
