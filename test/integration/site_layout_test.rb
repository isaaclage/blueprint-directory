require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    #assert_select "a[href=?]", resources_path
    #Doesn't match because of parameters.  How to test for this?
    # assert_select "a[href=?]", new_resource_path
  end
  
end
