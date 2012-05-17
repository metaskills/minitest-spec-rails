module MiniTest::Expectations
  ##
  # See ActiveSupport::Testing::Assertions#assert_difference
  #
  #    proc { ... }.must_change [difference]
  #
  # :method: must_change
  infect_an_assertion :assert_difference, :must_change

  ##
  # See ActiveSupport::Testing::Assertions#assert_no_difference
  #
  #    proc { ... }.wont_change
  #
  # :method: wont_change
  infect_an_assertion :assert_no_difference, :wont_change

  ##
  # See ActiveSupport::Testing::Assertions#assert_blank
  #
  #    obj.must_be_blank
  #
  # :method: must_be_blank
  infect_an_assertion :assert_blank, :must_be_blank, :unary

  ##
  # See ActiveSupport::Testing::Assertions#assert_present
  #
  #    obj.must_be_present
  #
  # :method: must_be_present
  infect_an_assertion :assert_present, :must_be_present, :unary

  ##
  # See ActionController::TemplateAssertions#assert_template
  #
  #    must_render_template "new"
  #
  # :method: must_render_template
  infect_an_assertion :assert_template, :must_render_template

  ##
  # See ActionDispatch::Assertions::DomAssertions#assert_dom_equal
  #
  #    a.dom_must_equal b
  #
  # :method: dom_must_equal
  infect_an_assertion :assert_dom_equal, :dom_must_equal

  ##
  # See ActionDispatch::Assertions::DomAssertions#assert_dom_not_equal
  #
  #    a.dom_wont_equal b
  #
  # :method: dom_wont_equal
  infect_an_assertion :assert_dom_not_equal, :dom_wont_equal

  ##
  # See ActionDispatch::Assertions::ResponseAssertions#assert_redirected_to
  #
  #    must_redirect_to login_url
  #
  # :method: must_redirect_to
  infect_an_assertion :assert_redirected_to, :must_redirect_to

  ##
  # See ActionDispatch::Assertions::ResponseAssertions#assert_response
  #
  #    must_respond_with :success
  #
  # :method: must_respond_with
  infect_an_assertion :assert_response, :must_respond_with

  ##
  # See ActionDispatch::Assertions::RoutingAssertions#assert_recognizes
  #
  #    must_recognize {controller: 'items', action: 'index'}, 'items'
  #
  # :method: must_recognize
  infect_an_assertion :assert_recognizes, :must_recognize

  ##
  # See ActionDispatch::Assertions::RoutingAssertions#assert_generates
  #
  #    must_generate "/items", controller: "items", action: "index"
  #
  # :method: must_generate
  infect_an_assertion :assert_generates, :must_generate

  ##
  # See ActionDispatch::Assertions::RoutingAssertions#assert_routing
  #
  #    must_route '/home', controller: 'home', action: 'index'
  #
  # :method: must_route
  infect_an_assertion :assert_routing, :must_route

  ##
  # See ActionDispatch::Assertions::SelectorAssertions#assert_select
  #
  #    proc { ... }.must_select "ol"
  #
  # :method: must_select
  infect_an_assertion :assert_select, :must_select

  ##
  # See ActionDispatch::Assertions::SelectorAssertions#assert_select_encoded
  #
  #    proc { ... }.must_select_encoded :atom
  #
  # :method: must_select_encoded
  infect_an_assertion :assert_select_encoded, :must_select_encoded

  ##
  # See ActionDispatch::Assertions::SelectorAssertions#assert_select_email
  #
  #    proc { ... }.must_select_email
  #
  # :method: must_select_email
  infect_an_assertion :assert_select_email, :must_select_email

  ##
  # See ActionDispatch::Assertions::TagAssertions#assert_tag
  #
  #    must_tag :span
  #
  # :method: must_tag
  infect_an_assertion :assert_tag, :must_tag

  ##
  # See ActionDispatch::Assertions::TagAssertions#assert_no_tag
  #
  #    wont_tag :div
  #
  # :method: wont_tag
  infect_an_assertion :assert_no_tag, :wont_tag
end
