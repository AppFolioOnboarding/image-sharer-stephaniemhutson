require 'test_helper'

VALID_URL = 'http://www.image.com'.freeze

class ImageTest < ActiveSupport::TestCase
  test 'image is valid' do
    @image = Image.new(image_url: VALID_URL)
    assert_predicate @image, :valid?
  end

  test 'requires image_url' do
    @image = Image.new
    refute_predicate @image, :valid?
    assert_includes(@image.errors.details[:image_url], error: :blank)
  end

  test 'image does not save with bad image_url' do
    @image = Image.new(image_url: 'www.badurl.com')
    refute_predicate @image, :valid?
    assert_includes(@image.errors.details[:image_url], error: :invalid, value: 'www.badurl.com')
  end

  test 'image can have tags added' do
    @image = Image.new(image_url: VALID_URL, tag_list: 'tag1')
    assert_predicate @image, :valid?
  end
end
