require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'new' do
    get '/images/new'
    assert_response :success
  end

  test 'create' do
    post '/images', params: { image: { image_url: 'http://image.com' } }
    follow_redirect!
    assert_response :success
  end

  test 'index includes a list of images' do
    post '/images', params: { image: { image_url: 'http://image.com' } }
    post '/images', params: { image: { image_url: 'http://image2.com' } }
    get '/images'

    assert_response :success
    assert_includes response.body, 'http://image.com'
    assert_includes response.body, 'http://image2.com'
  end
end
