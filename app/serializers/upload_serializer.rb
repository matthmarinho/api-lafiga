class UploadSerializer < ApplicationSerializer
  attributes :id, :title, :description, :link

  def link
    base_url = Rails.env == 'production' ? 'https://lafiga.herokuapp.com/' : 'http://localhost:5000'
    "#{base_url}#{object.attachment.url}"
  end
end
