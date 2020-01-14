class Image < ApplicationRecord
  validates :image_url, presence: true, format: {
    with: %r{(http|https):\/\/*}, message: 'Requires valid url (http/https required)'
  }
end
