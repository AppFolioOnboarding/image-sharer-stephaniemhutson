require 'test_helper'

# application_contoller_test
class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'home renders' do
    get '/'
    assert_response :success
  end
end
