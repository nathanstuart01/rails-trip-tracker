require 'test_helper'

class NewsletterControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get newsletter_new_url
    assert_response :success
  end

end
