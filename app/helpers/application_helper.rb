module ApplicationHelper
  def transform_message(message_type)
    { 'error' => 'red', 'success' => 'green', 'notice' => 'blue' }.find(proc { '' }) do |key, value|
      return value if message_type == key
    end
  end
end
