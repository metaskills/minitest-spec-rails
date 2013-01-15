ActionView::TestCase.instance_eval do

  register_spec_type(/(Helper|View)( ?Test)?\z/i, self)

  # Properly allow the parent class to memoize this for subclasses.
  # Just like ActionController::TestCase does.
  class_attribute :_helper_class
  def helper_class=(new_class)
    self._helper_class = new_class
  end
  def helper_class
    if current_helper_class = self._helper_class
      current_helper_class
    else
      self.helper_class = determine_default_helper_class(name)
    end
  end


end
