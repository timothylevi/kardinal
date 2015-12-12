Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FB_APP_ID'], ENV['FB_APP_SECRET'],
    :image_size => 'large', :info_fields => 'email, name, website, location'
end
