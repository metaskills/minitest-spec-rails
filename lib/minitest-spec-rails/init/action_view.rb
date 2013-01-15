ActionView::TestCase.instance_eval do

  register_spec_type(/(Helper|View)( ?Test)?\z/i, self)

end
