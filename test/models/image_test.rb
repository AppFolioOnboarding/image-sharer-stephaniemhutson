require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'image is valid' do
    @image = Image.new(image_url: 'http://www.image.com')
    @image.valid?
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
end
