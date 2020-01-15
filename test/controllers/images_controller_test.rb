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

  test 'index includes a list of images with tags' do
    post '/images', params: { image: { image_url: 'http://image.com', tag_list: 'unique_tag' } }
    get '/images'

    assert_response :success
    assert_includes response.body, 'http://image.com'
    # TODO: (stephanie hutson) It might be a good idea to test for not just the presense of
    # the tag in the response body, but to test for a specific element. As it is, there is
    # very little structure to the index page beyond a list of pictures and tags, and I think
    # this is sufficient
    assert_includes response.body, 'unique_tag'
  end

  test 'show displays tags' do
    post '/images', params: { image: { image_url: 'http://image.com', tag_list: 'unique_tag' } }
    follow_redirect!

    assert_response :success
    assert_includes response.body, 'unique_tag'
  end

  test 'index allows querying by tag' do
    post '/images', params: { image: { image_url: 'http://image.com', tag_list: 'unique_tag' } }
    post '/images', params: { image: { image_url: 'http://image2.com' } }

    get '/images?tag_filter=unique_tag'
    assert_response :success

    # asserts the image with the tag is shown, and without it not
    assert_includes response.body, 'http://image.com'
    refute_includes response.body, 'http://image2.com'
  end
end
