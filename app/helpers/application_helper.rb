module ApplicationHelper
  def body_classes
    "controller-#{controller_class} action-#{action_name} #{controller_class}-#{action_name}"
  end

  def controller_class
    "#{controller_name.gsub('/', '--')}"
  end
end
